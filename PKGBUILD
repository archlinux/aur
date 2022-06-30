# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.5.4
pkgrel=2
pkgdesc="Self hosted ebook and comic reader"
arch=('i686' 'x86_64')
url="https://www.kavitareader.com/"
license=('GPL3')
depends=()
makedepends=()
source=(
https://github.com/Kareadita/Kavita/releases/download/v$pkgver/kavita-linux-x64.tar.gz
)
md5sums=(
26397b12e9e7ba4f6d952b47e5bb9643
)

build() {
    cd "${srcdir}"

    tar -xvf kavita-linux-x64.tar.gz
    cd Kavita
    chmod 755 Kavita
}

package() {

mkdir -p $pkgdir/opt/kavita
cp -Ra $srcdir/Kavita/* $pkgdir/opt/kavita
install=kavita.install
install -Dm 644 ../kavita.service -t "$pkgdir"/usr/lib/systemd/system/

}

