# Maintainer: Ivan Tiukov <ivan@tiukov.com>

pkgname=remotixqc
pkgver=1.4.1
pkgrel=340
pkgdesc="Remotix QC is a tiny portable application with zero configuration. Run it on a computer that you want to observe or control remotely."
arch=('x86_64')
url="https://remotixcloud.com"
license=('custom:freeware')
depends=('qt5-base' 'wayland' 'libx11')

source_x86_64=(https://eu.downloads.remotix.com/agent-linux/remotixagent-${pkgver}-${pkgrel}.x86_64.deb)

sha256sums_x86_64=('4f67d440c9ccf38cb6764d7873d23f72616e2f3a51dd5b6256de165f295439e4')

package() {
    cd "${pkgdir}"
    tar -xpJf "${srcdir}/data.tar.xz"

    systectl restart remotixagent
}
