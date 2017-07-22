# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  D. Bohdan <http://dbohdan.com/contact/>

pkgname=s2png-git
pkgver=v0.7.2
pkgrel=1

pkgdesc='stuff to PNG'
arch=('i686' 'x86_64')
url='https://github.com/dbohdan/s2png'
license=('GPLv2')
depends=('gd')
provides=('s2png' 's2png-git')
conflicts=('s2png' 's2png-git')
source=('git://github.com/dbohdan/s2png')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/s2png/"
    git reset --hard HEAD > /dev/null 2>&1
    git describe --tags | sed 's/-/./g'
}

build() {
    cd "$srcdir/s2png/"
    git reset --hard HEAD > /dev/null 2>&1
    make
}

package() {
    install -Dm755 "$srcdir/s2png/s2png" "$pkgdir/usr/bin/s2png"
}
