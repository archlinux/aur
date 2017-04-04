# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=x3dna-dssr
pkgver=1.6.8_20170328
pkgrel=1
pkgdesc="DSSR, an integrated software tool for Dissecting the Spatial Structure of RNA. Please see: http://forum.x3dna.org/site-announcements/download-instructions/"
arch=('x86_64')
url="http://x3dna.org/"
license=('custom')
depends=('glibc')
source=("${pkgname}.md5")
md5sums=('12cdf0c8c017f0c92ba446b842fd3bfa')

package() {
    if [[ ! -r "../${pkgname}" ]]; then
        echo 'You must download x3dna-dssr binary on your own from the project webpage'
        echo 'See: http://forum.x3dna.org/site-announcements/download-instructions/'
        return 1
    fi
    if ! md5sum --quiet --check "${pkgname}.md5"; then
        echo 'Invalid checksum!'
        return 1
    fi

    install -D ../${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
