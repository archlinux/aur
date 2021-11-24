pkgname=apt-file
pkgver=3.2.2
pkgrel=1
pkgdesc='APT package searching utility'
url='https://packages.debian.org'
arch=('any')
license=('GPL')
depends=('perl-aptpkg')
source=("http://deb.debian.org/debian/pool/main/a/apt-file/apt-file_${pkgver}.tar.xz")
sha256sums=('bacbfb038dca6d2f0b740dcd05064d0b81fd0f086ce2eb59c5157d13ef064edf')
backup=('etc/apt/apt.conf.d/50apt-file.conf')

build(){
  cd apt-file
  make
}

package(){
  cd apt-file
  make DESTDIR="${pkgdir}" install
  install -Dm644 debian/bash-completion "${pkgdir}/etc/bash_completion.d/apt-file"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/apt-file/README.md"
}
