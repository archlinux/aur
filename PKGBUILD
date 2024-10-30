# Maintainer: Aleks Grabowski <hurufu+aur@gmail.com>
pkgname=prolog-tags
pkgver=19890305
pkgrel=1
pkgdesc='Create tags file for Prolog sources'
arch=(i686 x86_64)
url='https://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/lang/prolog/util/ptags/0.html'
license=(unknown)
conflicts=(ptags ptags-git)
source=('https://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/lang/prolog/util/ptags/ptags.tgz')
sha256sums=('7b568cee8a8b37c9a9171754c379818bfe08cc6c202bc1fb7e0294c43ced2ab4')

prepare() {
    patch -d "$srcdir/ptags" -p1 < ../0001-Fix-compilation-on-Linux.patch
}

build() {
    make -C ptags
}

package() {
    make -C ptags DESTDIR="$pkgdir/" install
}
