# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=clerk
pkgver=4.0.5
pkgrel=1
pkgdesc="rofi/fzf driven mpd client"
arch=('any')
url='https://github.com/carnager/clerk'
license=('MIT')
depends=('perl' 'perl-data-section-simple' 'fzf' 'rofi' 'tmux' 'perl-net-mpd' 'perl-data-messagepack' 'perl-file-slurper' 'perl-config-simple' 'perl-try-tiny' 'perl-ipc-run' 'perl-http-date')
install=clerk.install
makedepends=('git')
optdepends=('flac: tagging support'
			'vorbis-tools: tagging support'
			'mutagen: tagging support')
source=("https://github.com/carnager/${pkgname}/archive/${pkgver}.tar.gz")

package() {
    install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/clerk.pl "${pkgdir}/usr/bin/clerk"
    install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/clerk_rating_client.service "${pkgdir}/usr/lib/systemd/user/clerk_rating_client.service"
    install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/clerk_rating_client "${pkgdir}/usr/bin/clerk_rating_client"
}
md5sums=('SKIP')
