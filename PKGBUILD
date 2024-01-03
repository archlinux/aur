# Maintainer: Jesco Topp <jesco.topp@gmail.com>
pkgname=starnet2-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="StarNet2 is the 2nd iteration of a neural network to remove stars from (nonlinear) astronomical images."
arch=("x86_64")
url="https://www.starnetastro.com/"
license=('custom')
groups=()
depends=('bash')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://starnetastro.com/wp-content/uploads/2022/03/StarNetv2CLI_linux.zip)
noextract=()
md5sums=() #autofill using updpkgsums
sha256sums=('504ce100ef08c39c0059d70a096075573e3cb3ec93d44015db6a60c014b76e96')

package() {
  cd "StarNetv2CLI_linux"

  dest="$pkgdir/opt/${pkgname}"

  install -D -t "$dest" -m 644 *.pb *.so.? README.txt *.tif
  install -D -t "$dest" -m 755 starnet++ run_starnet.sh
  install -D -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" -m 644 LICENSE

  # no symlink in /usr/bin because starnet++ script needs to be in the same folder as its libs
  #mkdir "$pkgdir"/usr/bin/
  #ln -s /opt/${pkgname}/starnet++ "$pkgdir"/usr/bin/starnet++
}


