# Maintainer: Luca Steccanella <steccas at pm dot me>
# Contributor: ZorinArch < zorinarch at protonmail dot com >

pkgname=windsurf-features
pkgver=1.1.0
pkgrel=1
pkgdesc='Unblock some features in windsurf'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('0BSD')
depends=('windsurf' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
provides=('windsurf-features')
conflicts=('windsurf-features')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json')
sha256sums=('78fd2ae98bb8f3da45206b6d980b81d588506b2b478f2977eaeafeca1a154318'
            '97e93d12e5ff5a24f7d96f722b601ce88a696291174af055d5897275467718e3'
            'd30965a5f2b93ea121a9ecf2a54c7f435572dd9adfe906e7429c9f3ac74e0c4e')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
