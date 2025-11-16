# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-features-insiders
pkgver=1.106.0
pkgrel=1
pkgdesc='Unblock some features in Code OSS, including features in VSCode Insiders'
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
md5sums=('a270718448070ecda3050b7569510105'
         '9ed6f3972479ab6d3d053e7c47ead55a'
         '7c9abf00a19f2ed81c726dafae5c75b3'
         '6923dcf184f1aa4948839c844d531581')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
  install -Dm 755 "${srcdir}/update.py" "${pkgdir}/usr/bin/code-features-insiders-update"
}
