# Maintainer: robertfoster

pkgname=vhdl-simili
pkgver=3.1b16
pkgrel=5
pkgdesc="A low-cost VHDL development system designed for the serious hardware designer."
arch=('i686' 'x86_64')
url="http://www.symphonyeda.com/products.htm"
license=('custom')
source=("http://www.symphonyeda.com/Downloads/Simili31b16-linux-x86.tar"
  "$pkgname.sh"
)
depends=('glibc' 'libx11')

if [[ "$CARCH" == 'x86_64' ]]; then
  depends=('lib32-'{'glibc','libx11'})
fi

package() {
  similidir=opt/simili
  cd $srcdir
  install -dm755 $pkgdir/$similidir
  tar xvf Simili31b16-linux-x86-image.tgz -C $pkgdir/$similidir
  install -Dm755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/bin/$pkgname"

  # Fix for Documentation
  ln -sr /usr/bin/firefox $pkgdir/usr/bin/mozilla
}

sha256sums=('1061c20394622827f47b8752eb9cb4a6557353d7add6aac4b8d0af65bb304363'
            '9bbc5cae0feb09fc880fef30a83d2b6bae8d20ce81c4b90b9e60f32d4f98471e')
