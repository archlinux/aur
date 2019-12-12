# Maintainer: Blaine Story <aur at blainestory com>
pkgname=video-contact-sheet
pkgver=1.13.4
pkgrel=1
pkgdesc="A script to create contact sheets (preview images) from videos."
arch=('i686' 'x86_64')
url="http://p.outlyer.net/vcs/"
license=('LGPL')
depends=('bash' 'ffmpeg' 'imagemagick')
optdepends=(
            'lsdvd: needed for DVD support'
            'perl: needed for DVD support'
            )
backup=('etc/vcs.conf')

source=("http://p.outlyer.net/vcs/files/vcs-${pkgver}.tar.gz")
sha256sums=('dc1d6145e10eeed61d16c3591cfe3496a6ac392c9c2f7c2393cbdb0cf248544b')


package() {
    cd "${srcdir}/vcs-${pkgver}"
    make DESTDIR="${pkgdir}" prefix=/usr install
    install -D examples/vcs.conf.example "${pkgdir}/etc/vcs.conf"
}
