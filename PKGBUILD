# Maintainer: cr0mag <phillips.julian AT gmail DOT com>
# Contributor: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
pkgname=ginger
pkgver=2.4.0
pkgrel=1
pkgdesc="Host system administration for WoK."
arch=(any)
url="https://github.com/kimchi-project/ginger"
license=('LGPL' 'APACHE')
groups=('kimchi-project')
depends=('hddtemp'
         'lm_sensors'
	 'python2-augeas'
	 'python2-netaddr'
	 'python2-ipaddr'
	 'python2-magic'
	 'python2-crypto'
	 'python2-ethtool'
	 'libuser'
	 'wokd'
	 'ginger-base')

# User files that should be saved. They are kept as Pacnew and Pacsave Files
backup=('etc/wok/plugins.d/ginger.conf')
source=('https://github.com/kimchi-project/ginger/archive/'${pkgver}'.tar.gz')
#md5sums=('2150b504f5df529bccf0314beec841a7')
sha256sums=('8ede9c4876419116f1027b5a7f40935c72d8b269a341b1f0b768d0581591219b')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
#  PYTHON=/usr/bin/python2 ./autogen.sh --system --localedir=/usr/share/kimchi/plugins/ginger/mo/locale
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}
