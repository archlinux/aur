# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.5.3
pkgrel=1
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
76fc780ae728d2948221a3e5fa4ae07c
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

