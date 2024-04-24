# Maintainer: PatJK <patjk at ik dot me>
# Contributor: silverhikari <kerrickethan@gmail.com>
# Contributor: Carson Rueter <roachh at proton mail dot com>

pkgname=vscodium-electron-features
pkgver=1.88.1
pkgrel=2
pkgdesc='Unblock some features in vscodium-electron'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('vscodium-electron' 'python' 'python-requests')
optdepends=('org.freedesktop.secrets: for settings sync feature')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.py'
        'patch.json')
md5sums=('9ac39c2aac494b944954be94e571ea37'
         'cf0f8ab249419563c5f4a78fbad09d75'
         '5cdf96d72d223e73827626bc3bb3e176')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.py" "${pkgdir}/usr/share/${pkgname}/patch.py"
  install -Dm 644 "${srcdir}/patch.json" "${pkgdir}/usr/share/${pkgname}/patch.json"
}
