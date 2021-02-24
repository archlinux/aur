# Maintainer: Jonathan Kotta <jpkotta@gmail.com>

_pkgname=starnet++
pkgname=starnet++-bin
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="StarNet is a neural network that can remove stars from images in one simple step leaving only background."
arch=('x86_64')
url="https://sourceforge.net/projects/starnet/"
license=('APACHE')
groups=()
depends=("bash")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://newcontinuum.dl.sourceforge.net/project/starnet/v${pkgver}/StarNet_Linux.tar.gz"
       launcher.sh)
md5sums=('454cfa616bf8ade6a28bf1ada5f27429'
         'dbf63532bbbdd1d0332307347283a085')
noextract=()
validpgpkeys=()

package() {
	cd "release"

    #install -D LICENSE /usr/share/licenses/$pkgname/LICENSE
    dest="$pkgdir/usr/lib/${pkgname}"
    install -D -t "$dest" -m 644 *.pb *.so.? README.txt
    install -D -t "$dest" -m 755 mono_starnet++ rgb_starnet++

    cd "$srcdir"
    install -D -m 755 launcher.sh "$pkgdir"/usr/bin/starnet-rgb
    install -D -m 755 launcher.sh "$pkgdir"/usr/bin/starnet-mono
}
