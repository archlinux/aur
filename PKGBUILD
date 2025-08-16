# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-features
pkgver=1.103.1
pkgrel=1
pkgdesc='Unblock some features in Code OSS'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('code' 'python' 'org.freedesktop.secrets')
optdepends=('icu69: for MS-vsliveshare.vsliveshare extension to work'
            'pacman-contrib: update checksums in local AUR package')
provides=('code-features')
conflicts=('code-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json'
        'update.py')
md5sums=('1d4002cba0560dd6da192ddd756f52e5'
         '9ed6f3972479ab6d3d053e7c47ead55a'
         '39fccffffd9e3ea08451f36a3f168d0a'
         '3d508df1aaea8e1d6123d65fa9af2468')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
  install -Dm 755 "${srcdir}/update.py" "${pkgdir}/usr/bin/code-features-update"
}
