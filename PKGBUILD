# Contributor: j-james <jj at j-james dot me>
pkgname=soundfont-ensembles
_pkgname=ensemblesgmsoundfont
_commit=778c352f943b8fdd80dd302ea5926bc14824c120 # inactive. Use latest commit.
pkgver=0.0.3.2023.g${_commit::8}
pkgrel=1
pkgdesc="Soundfonts for Ensembles"
arch=('any')
url='https://gitlab.com/SubhadeepJasu/ensemblesgmsoundfont'
groups=('soundfonts')
makedepends=(git meson ninja)
source=("git+${url}.git#commit=$_commit")
sha256sums=('24351db4dcf4651a94afff9b4af1599a35e75082fe7838fa2afa315a42d1d8d9')

build() {
  cd ensemblesgmsoundfont
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ensemblesgmsoundfont
  DESTDIR="$pkgdir/" ninja -C build install
  mv -v "$pkgdir"/usr/share/{sounds,soundfonts}
}
