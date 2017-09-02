# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=perl-extract-url
_realname=extracturl
pkgver=1.6.2
pkgrel=2
pkgdesc="A Perl script that extracts URLs from correctly-encoded MIME email messages"
arch=('any')
url='http://www.memoryhole.net/~kyle/extract_url'
license=('BSD')
depends=('perl>=5.10.0' 'perl-mime-tools' 'perl-html-parser')
optdepends=('perl-curses-ui: curses interface'
            'perl-uri-find: enhanced uri extraction')
replaces=('extract_url')
source=("https://github.com/m3m0ryh0l3/${_realname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${_realname}-${pkgver}"
  export_MM_USE_DEFAULT=1 INSTALLDIRS=vendor
  make
}

package() {
  cd "${_realname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

