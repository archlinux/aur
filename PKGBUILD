# Maintainer: Ng Oon-Ee <ngoonee.talk@gmail.com>
pkgname=beancount-fava-git
pkgver=r1238.f17754c
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('MIT')
groups=()
depends=('beancount-hg'
         'python'
         'python-click'
         'python-markdown2'
         'python-flask-babel'
         'python-google-api-python-client'
         'python-beautifulsoup4'
         'python-magic-ahupp')
makedepends=('git'
             'nodejs'
             'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('beancount-fava::git://github.com/beancount/fava.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
    python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="${pkgdir}"
}
