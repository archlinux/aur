# Maintainer: Bert Burgemeister <trebbu@googlemail.com>
pkgname=pipeglade
pkgver=4.2.0
pkgrel=1
pkgdesc="Pipe-driven GTK+ interfaces that can be designed using Glade"
arch=('i686' 'x86_64')
url="http://pipeglade.boundp.org"
license=('MIT')
groups=()
depends=('gtk3' 'gsfonts')
makedepends=()
optdepends=('glade: create .ui files')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://github.com/trebb/pipeglade/archive/$pkgver.tar.gz")
noextract=()
md5sums=('9fce4dd6dae9855964a122fd83a49331')

build() {
    cd "$pkgname-$pkgver"

    make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/man/man1/"
  install -d "${pkgdir}/usr/share/pipeglade/examples/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install "pipeglade" "${pkgdir}/usr/bin/"
  install -m644 "pipeglade.1" "${pkgdir}/usr/share/man/man1/"
  install -m644 "pipeglade.ui" "simple_dialog.ui" "simple_open.ui" \
	  "${pkgdir}/usr/share/pipeglade/examples/"
  install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  
}
