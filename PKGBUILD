pkgname=hammond
pkgver=0.3.1
pkgrel=1
pkgdesc="GNOME Podcast client"
arch=('x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/alatiera/hammond"
depends=('glib2' 'openssl' 'sqlite' 'gtk3')
makedepends=('gtk3' 'rust' 'pkg-config' 'git' 'meson')
source=("https://gitlab.gnome.org/alatiera/hammond/repository/0.3.1/archive.tar.gz")
noextract=('archive.tar.gz')
_commit="89ee174dedeb49124eb13928bf0fad25d30e62ab"
sha256sums=('08e30a6ad3d578a77ded06cee4fd0f7ce5972f8adccf6eb3422b3c99590a3996')

prepare() {
    tar -xvf archive.tar.gz
}

build() {
    cd ${pkgname}-${pkgver}-${_commit}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}-${_commit}
    make DESTDIR="$pkgdir" install
}
