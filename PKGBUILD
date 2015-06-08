# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=perl-extract-url
_realname=extract_url
pkgver=1.5.8
pkgrel=1
pkgdesc="A Perl script that extracts URLs from correctly-encoded MIME email messages"
arch=('any')
url='https://code.google.com/p/extracturl/'
license=('BSD')
depends=('perl>=5.10.0' 'perl-mime-tools' 'perl-html-parser')
optdepends=('perl-curses-ui: curses interface'
            'perl-uri-find: enhanced uri extraction')
replaces=('extract_url')
source=("https://extracturl.googlecode.com/files/${_realname}-${pkgver}.tar.gz")
md5sums=('579b4504ba4c89ca6331af89ba40f827')

build() {
  cd "${srcdir}/${_realname}"
  make
}
  
package() {
  cd "${srcdir}/${_realname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
