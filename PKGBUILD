# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgbase=gtk-theme-bubble-git
pkgname=('gtk-theme-bubble-dark-git'
         'gtk-theme-bubble-darker-git'
         'gtk-theme-bubble-lighter-git')
pkgver=r140.60cd4f9
pkgrel=1
pkgdesc="A GTK theme based on Arc-Theme"
arch=('any')
url="https://github.com/i-mint/Bubble"
license=('GPL3')
depends=('gtk3>=3.22')
makedepends=('git')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_gtk-theme-bubble-dark-git()  {
  provides=("${pkgname%-git}" "${pkgbase%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find Bubble-Dark \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

package_gtk-theme-bubble-darker-git()  {
  provides=("${pkgname%-git}" "${pkgbase%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find Bubble-Darker \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

package_gtk-theme-bubble-lighter-git()  {
  provides=("${pkgname%-git}" "${pkgbase%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find Bubble-Lighter \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

