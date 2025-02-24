# Maintainers: (refer to the github page)
pkgname=raat-server
pkgver=2.1.0
pkgrel=1
pkgdesc="Remote Archlinux Android Tool (server) for managing and connecting to VNC sessions"
arch=('any')
url="https://github.com/Student-Team-Projects/RAAT-Server"
license=('GPL')
depends=(
    'lxde-common' 'lxsession' 'tigervnc' 'openssh' 'iproute2'
    'dbus' 'xorg-xrdb' 'xorg-xrandr' 'xorg-xinit' 'jq' 'cinnamon'
)

source=(
    "https://github.com/Student-Team-Projects/RAAT-Server/releases/download/v${pkgver}/raat-server-bin.tar.gz"
    "https://raw.githubusercontent.com/Student-Team-Projects/RAAT-Server/main/README.md"
)

# noextract=("app-release.apk")

# sha256sums=(
#     'c0fdb56c7f58505c728f8af906049284c10f878a6f9de23b1104efecac91ea34'
#     '94e6e654558984f92227927c6a48988bd37de0a0ebd767a1b3d06716ce38955f' 
# )

sha256sums=('SKIP' 'SKIP')


package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/doc/raat-server"

    tar -xzvf "${srcdir}/raat-server-bin.tar.gz" -C "${srcdir}/"

    cp "${srcdir}/raat-server.sh" "${pkgdir}/usr/bin/raat-server"
    cp "${srcdir}/raat-connect.sh" "${pkgdir}/usr/bin/raat-connect"
    cp "${srcdir}/raat-close-session.sh" "${pkgdir}/usr/bin/raat-close-session"
    cp "${srcdir}/raat-server-request.sh" "${pkgdir}/usr/bin/raat-server-request"

    chmod +x "${pkgdir}/usr/bin/raat-server"
    chmod +x "${pkgdir}/usr/bin/raat-connect"
    chmod +x "${pkgdir}/usr/bin/raat-close-session"
    chmod +x "${pkgdir}/usr/bin/raat-server-request"

    cp "${srcdir}/README.md" "${pkgdir}/usr/share/doc/raat-server/README.md"

    
    cp "${srcdir}/rebuild.sh" "${pkgdir}/usr/bin/raat-rebuild"
    chmod +x "${pkgdir}/usr/bin/raat-rebuild"

    # cp "${srcdir}/raat-client-v1.0.0.apk" "${pkgdir}/usr/opt/raat-client.apk"
    # cp "${srcdir}/app-release.apk" "${pkgdir}/usr/opt/raat-client.apk"

}