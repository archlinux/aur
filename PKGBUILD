# Maintainers: (refer to the github page)
pkgname="raat-server"
pkgver=1.1.0
apkver=1.0.0
pkgrel=1
pkgdesc="Remote Archlinux Android Tool (server)"
arch=('any')
url="https://github.com/Student-Team-Projects/RAAT-Server"
license=('GPL')
depends=('lxde-common' 'lxsession' 'openbox' 'tigervnc' 'openssh' 'iproute2')

source=(
    "https://github.com/Student-Team-Projects/RAAT-Server/releases/download/v${pkgver}/raat-server-v${pkgver}.tar.gz"
    "https://github.com/Student-Team-Projects/RAAT/releases/download/v${apkver}/raat-client-v${apkver}.apk"
)

noextract=("raat-client-v${apkver}.apk")

sha256sums=(
    'c75be812f22d325ed75d0cbe7d1c7d967c75698c0852b2c07c0aedfd6a34891f'
    '94e6e654558984f92227927c6a48988bd37de0a0ebd767a1b3d06716ce38955f' 
)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/opt"
    cp "${srcdir}/script.sh" "${pkgdir}/usr/bin/raat-server"
    cp "${srcdir}/raat-connect.sh" "${pkgdir}/usr/bin/raat-connect"
    chmod +x "${pkgdir}/usr/bin/raat-server"
    chmod +x "${pkgdir}/usr/bin/raat-connect"
    cp "${srcdir}/raat-client-v1.0.0.apk" "${pkgdir}/usr/opt/raat-client.apk"
}