# Maintainer: Barfin
# Contributor: DanielH, agstrc

pkgname=iriunwebcam-bin
pkgver=2.7
pkgrel=1
pkgdesc="Use your phone's camera as a wireless webcam in your PC."
arch=('any')
url="http://iriun.gitlab.io"
license=(unknown)
source=("iriunwebcam-${pkgver}.deb::http://iriun.gitlab.io/iriunwebcam-${pkgver}.deb")
options=('!strip')
depends=('jack' 'qt5-base' 'v4l2loopback-dkms' 'android-tools')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    # The permissions on the upstream file are wrong (eg: /etc is set to 775 instead of 755)
    # The command below sets directories to 755 but files to 644
    chmod -R u+rwX,go+rX,go-w "${pkgdir}"
    chmod 755 "${pkgdir}/usr/local/bin/iriunwebcam"
}

md5sums=('0c96650189ad6f579e6104c62e3b50c4')
