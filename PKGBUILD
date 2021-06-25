# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=makepkg-nosudo
pkgver=6.0.0
pkgrel=1
pkgdesc='Use su instead of sudo in makepkg, for more convenient use in termux'
arch=('any')
url='https://github.com/sdrausty/TermuxArch/issues/38'
license=('unknown')
depends=('patch' 'pacman')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'makepkg.diff')
md5sums=('b3eade72b345947a68edf45f073c93d9'
         '6da5e07673cf186060e49b63ce9e34ee')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 644 "${srcdir}/makepkg.diff" "${pkgdir}/usr/share/${pkgname}/makepkg.diff"
}
