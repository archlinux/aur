pkgname=apt-file
pkgver=3.3
pkgrel=1
pkgdesc='APT package searching utility'
url='https://packages.debian.org'
arch=('any')
license=('GPL')
depends=('perl-aptpkg')
source=("http://deb.debian.org/debian/pool/main/a/apt-file/apt-file_${pkgver}.tar.xz")
sha256sums=('2ab7109340054f0073c690d62d055c31bf69e1f50fb65b080bbf0d4ae572dae7')
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
