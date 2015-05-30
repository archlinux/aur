# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jamie Nguyen <jamie@tomoyolinux.co.uk>

pkgname=bashtagger
pkgver=1.1.0
pkgrel=1
pkgdesc="A menu-driven bash script for the management of OGG and FLAC tags"
arch=('any')
url='http://www.sourceforge.net/projects/bashtagger/'
license=('GPL2')
depends=('flac' 'vorbis-tools')
backup=('etc/bashtagger.conf')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('687149f1170c5d16ca0734b15c7ab06063f7e3c804ea79f5c1db4537b613c5cf')


package() {
  cd "${srcdir}/$pkgname-${pkgver}"

  # install script
  install -D -m755 bashtagger "${pkgdir}/usr/bin/bashtagger"

  # install config file
  install -D -m644 bashtagger.conf "${pkgdir}/etc/bashtagger.conf"

  # install man page
  gzip -c -9 bashtagger.1 > bashtagger.1.gz
  install -D -m644 bashtagger.1.gz "${pkgdir}/usr/share/man/man1/bashtagger.1.gz"

  # install documentation
  install -d -m755 "${pkgdir}/usr/share/doc/bashtagger"
  install -m644 AUTHORS "${pkgdir}/usr/share/doc/bashtagger/AUTHORS"
  install -m644 COPYING "${pkgdir}/usr/share/doc/bashtagger/COPYING"
  install -m644 NEWS "${pkgdir}/usr/share/doc/bashtagger/NEWS"
}
