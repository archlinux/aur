# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-arch
pkgver=202609011
pkgrel=1
pkgdesc="Phoenix is a suite of configurations & advanced modifications for Mozilla Firefox, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL-3.0-or-later')
url="https://phoenix.celenity.dev"
source=("${pkgname}-${pkgver}-${pkgrel}.tar.xz::https://releases.celenity.dev/phoenix/releases/2026.09.01.1/linux/phoenix-2026.09.01.1-linux.tar.xz")
sha512sums=('3ba0d4740d96a1f2b486ee222baf8beca7158330cf8bd8a6bfba158256c1f916aec51f217f6772b0ff66f5ee37a03590d831ffdd11cbfd6c79469ace0160deaf')

pkgver() {
  echo "$pkgver"
}

package() {
  local tmpdir=$(mktemp -d)

  tar xJf "$srcdir/${pkgname}-${pkgver}-${pkgrel}.tar.xz" -C "$tmpdir"

  install -Dm644 "$tmpdir/assets/about/attribution.css"                   "$pkgdir/etc/firefox/phoenix/assets/about/attribution.css"
  install -Dm644 "$tmpdir/assets/about/attribution.html"                  "$pkgdir/etc/firefox/phoenix/assets/about/attribution.html"
  install -Dm644 "$tmpdir/assets/about/phoenix.css"                       "$pkgdir/etc/firefox/phoenix/assets/about/phoenix.css"
  install -Dm644 "$tmpdir/assets/about/phoenix.html"                      "$pkgdir/etc/firefox/phoenix/assets/about/phoenix.html"
  install -Dm644 "$tmpdir/assets/phoenix.png"                             "$pkgdir/etc/firefox/phoenix/assets/phoenix.png"
  install -Dm644 "$tmpdir/defaults/pref/phoenix.js"                       "$pkgdir/etc/firefox/defaults/pref/phoenix.js"
  install -Dm644 "$tmpdir/etc/profile.d/phoenix-env-overrides.sh"         "$pkgdir/etc/profile.d/phoenix-env-overrides.sh"
  install -Dm644 "$tmpdir/phoenix.cfg"                                    "$pkgdir/etc/firefox/phoenix.cfg"
  install -Dm644 "$tmpdir/policies/policies.json"                         "$pkgdir/etc/firefox/policies/policies.json"
  install -Dm644 "$tmpdir/specs/phoenix-specialized.cfg"                  "$pkgdir/etc/firefox/phoenix/specs/phoenix-specialized.cfg"
  install -Dm644 "$tmpdir/specs/README.md"                                "$pkgdir/etc/firefox/phoenix/specs/README.md"
  install -Dm644 "$tmpdir/specs/permissions/apple-maps-permissions.txt"   "$pkgdir/etc/firefox/phoenix/specs/permissions/apple-maps-permissions.txt"
  install -Dm644 "$tmpdir/specs/permissions/discord-permissions.txt"      "$pkgdir/etc/firefox/phoenix/specs/permissions/discord-permissions.txt"
  install -Dm644 "$tmpdir/specs/permissions/element-permissions.txt"      "$pkgdir/etc/firefox/phoenix/specs/permissions/element-permissions.txt"
  install -Dm644 "$tmpdir/specs/permissions/google-maps-permissions.txt"  "$pkgdir/etc/firefox/phoenix/specs/permissions/google-maps-permissions.txt"
  install -Dm644 "$tmpdir/specs/permissions/twitter-permissions.txt"      "$pkgdir/etc/firefox/phoenix/specs/permissions/twitter-permissions.txt"
  install -Dm644 "$tmpdir/specs/userjs/apple-maps/user.js"                "$pkgdir/etc/firefox/phoenix/specs/userjs/apple-maps/user.js"
  install -Dm644 "$tmpdir/specs/userjs/discord/user.js"                   "$pkgdir/etc/firefox/phoenix/specs/userjs/discord/user.js"
  install -Dm644 "$tmpdir/specs/userjs/element/user.js"                   "$pkgdir/etc/firefox/phoenix/specs/userjs/element/user.js"
  install -Dm644 "$tmpdir/specs/userjs/google-maps/user.js"               "$pkgdir/etc/firefox/phoenix/specs/userjs/google-maps/user.js"
  install -Dm644 "$tmpdir/specs/userjs/photopea/user.js"                  "$pkgdir/etc/firefox/phoenix/specs/userjs/photopea/user.js"
  install -Dm644 "$tmpdir/specs/userjs/twitter/user.js"                   "$pkgdir/etc/firefox/phoenix/specs/userjs/twitter/user.js"
  install -Dm644 "$tmpdir/specs/userjs/youtube/user.js"                   "$pkgdir/etc/firefox/phoenix/specs/userjs/youtube/user.js"
  install -Dm644 "$tmpdir/specs/userjs/youtube-music/user.js"             "$pkgdir/etc/firefox/phoenix/specs/userjs/youtube-music/user.js"
  install -Dm644 "$tmpdir/COPYING.txt"                                    "$pkgdir/usr/share/doc/phoenix/COPYING.txt"
  install -Dm644 "$tmpdir/README.md"                                      "$pkgdir/usr/share/doc/phoenix/README.md"

  rm -f "$pkgdir/etc/firefox/defaults/pref/phoenix-desktop.js"
  rm -f "$pkgdir/etc/firefox/phoenix/assets/spec-welcome.txt"
  rm -f "$pkgdir/usr/lib/firefox/phoenix.cfg"
  rm -rf "$pkgdir/etc/firefox/phoenix/configs"
  rm -rf "$pkgdir/etc/firefox/phoenix/resources"
  rm -rf "$pkgdir/etc/firefox/phoenix/userjs"
  rm -rf "$tmpdir"
}
