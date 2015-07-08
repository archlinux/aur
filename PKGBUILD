# Maintainer: Jashandeep Sohi <jashandeep.s.sohi@gmail.com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
# Contributor: utdemir <utdemir@riseup.net>

pkgname='pelican-git'
pkgver=3.5.0.r103.g8a47973
pkgrel=1
pkgdesc='A static site generator written in Python w/ reST/Markdown support.'
url='http://blog.getpelican.com/'
license=('AGPL3')
source=($pkgname'::git+https://github.com/getpelican/pelican.git')
md5sums=('SKIP')
arch=('any')
depends=(
 'python-feedgenerator'
 'python-jinja'
 'python-pygments'
 'python-docutils'
 'python-pytz'
 'python-blinker'
 'python-unidecode'
 'python-six'
 'python-markupsafe'
 'python-dateutil'
 'python'
)
makedepends=('git' 'python' 'python-setuptools')
optdepends=(
 'python-markdown: for supporting Markdown as an input format.'
 'python-typogrify: for typographical enhancements.'
)
conflicts=('pelican')
provides=('pelican')

pkgver() {
 cd "$srcdir/$pkgname"
 git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
 cd "$srcdir/$pkgname"
 python setup.py install --root=$pkgdir
}

# vim: tabstop=1 expandtab
