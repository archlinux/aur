# Maintainer: Semirose <AppdullahMohammed at gmail dot com>.
# edited copy of PKGBUILD from vscodium-features.

pkgname=vscodium-translucent-features

pkgver=1.82.2
pkgrel=1
pkgdesc='Unblock some features in VSCodium'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('vscodium-translucent' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('vscodium-translucent-features')
conflicts=('vscodium-translucent-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
		"${pkgname}.install"
        'patch.py'
        'patch.json')
md5sums=('5b3d6c42f3cf6fb87f16a74b902ce21c'
         '1917046060a208aa89cade8ce014b711'
         '697c73a9dbdf137ec201be5bb496b00f'
         '5cdf96d72d223e73827626bc3bb3e176')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
