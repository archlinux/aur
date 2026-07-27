# Maintainer: celenity <celenity@celenity.dev>
pkgname=phoenix-flatpak
pkgver=202607271
pkgrel=1
pkgdesc="Phoenix is a suite of configurations & advanced modifications for Mozilla Firefox, designed to put the user first - with a focus on privacy, security, freedom, & usability."
arch=(any)
license=('GPL-3.0-or-later')
url="https://phoenix.celenity.dev"
source=("${pkgname}-${pkgver}-${pkgrel}.tar.xz::https://releases.celenity.dev/phoenix/releases/2026.07.27.1/linux-flatpak/phoenix-2026.07.27.1-linux-flatpak.tar.xz")
sha512sums=('d2cd8eda4d33cca39b023f56c56551a2024b9b9bb0d35a169a0a7eebe8f9ee781b97aa7a454efe1aa4ead6ea20da88b7835e7b847c737d197d81bc2b3eece558')

pkgver() {
  echo "$pkgver"
}

package() {
  local tmpdir=$(mktemp -d)

  tar xJf "$srcdir/${pkgname}-${pkgver}-${pkgrel}.tar.xz" -C "$tmpdir"

  install -Dm644 "$tmpdir/assets/about/attribution.css"                   "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/about/attribution.css"
  install -Dm644 "$tmpdir/assets/about/attribution.html"                  "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/about/attribution.html"
  install -Dm644 "$tmpdir/assets/about/phoenix.css"                       "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/about/phoenix.css"
  install -Dm644 "$tmpdir/assets/about/phoenix.html"                      "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/about/phoenix.html"
  install -Dm644 "$tmpdir/assets/phoenix.png"                             "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/assets/phoenix.png"
  install -Dm644 "$tmpdir/defaults/pref/phoenix.js"                       "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/defaults/pref/phoenix.js"
  install -Dm644 "$tmpdir/phoenix.cfg"                                    "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/phoenix.cfg"
  install -Dm644 "$tmpdir/policies/policies.json"                         "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/policies/policies.json"
  install -Dm644 "$tmpdir/specs/phoenix-specialized.cfg"                  "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/phoenix-specialized.cfg"
  install -Dm644 "$tmpdir/specs/README.md"                                "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/README.md"
  install -Dm644 "$tmpdir/specs/permissions/apple-maps-permissions.txt"   "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/permissions/apple-maps-permissions.txt"
  install -Dm644 "$tmpdir/specs/permissions/discord-permissions.txt"      "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/permissions/discord-permissions.txt"
  install -Dm644 "$tmpdir/specs/permissions/element-permissions.txt"      "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/permissions/element-permissions.txt"
  install -Dm644 "$tmpdir/specs/permissions/google-maps-permissions.txt"  "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/permissions/google-maps-permissions.txt"
  install -Dm644 "$tmpdir/specs/permissions/twitter-permissions.txt"      "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/permissions/twitter-permissions.txt"
  install -Dm644 "$tmpdir/specs/userjs/apple-maps/user.js"                "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/userjs/apple-maps/user.js"
  install -Dm644 "$tmpdir/specs/userjs/discord/user.js"                   "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/userjs/discord/user.js"
  install -Dm644 "$tmpdir/specs/userjs/element/user.js"                   "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/userjs/element/user.js"
  install -Dm644 "$tmpdir/specs/userjs/google-maps/user.js"               "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/userjs/google-maps/user.js"
  install -Dm644 "$tmpdir/specs/userjs/photopea/user.js"                  "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/userjs/photopea/user.js"
  install -Dm644 "$tmpdir/specs/userjs/twitter/user.js"                   "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/userjs/twitter/user.js"
  install -Dm644 "$tmpdir/specs/userjs/youtube/user.js"                   "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/userjs/youtube/user.js"
  install -Dm644 "$tmpdir/specs/userjs/youtube-music/user.js"             "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/specs/userjs/youtube-music/user.js"
  install -Dm644 "$tmpdir/COPYING.txt"                                    "$pkgdir/usr/share/doc/phoenix-flatpak/COPYING.txt"
  install -Dm644 "$tmpdir/README.md"                                      "$pkgdir/usr/share/doc/phoenix-flatpak/README.md"

  rm -f "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/defaults/pref/phoenix-desktop.js"
  rm -rf "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/configs"
  rm -rf "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/resources"
  rm -rf "$pkgdir/var/lib/flatpak/app/org.mozilla.firefox/current/active/files/etc/firefox/phoenix/userjs"
  rm -rf "$tmpdir"
}
