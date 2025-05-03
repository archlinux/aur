# Maintainer: Mikescher <aur@mikescher.com>
# Repo:       https://github.com/Mikescher/key-project-aur

pkgname=key-project
pkgver=2.12.3
pkgrel=1

pkgdesc="A program to use formal verification with Java programs"

url="https://www.key-project.org/"
license=('GPL')

arch=('any')
depends=('java-runtime')

source=(
  "key-project"
  "key-project.desktop"
  "key-project16.png"
  "key-project32.png"
  "key-project64.png"
  "https://github.com/KeYProject/key/releases/download/KEY-$pkgver/key-$pkgver-exe.jar"
)

noextract=("key-$pkgver-exe.jar")

sha256sums=('102d85d94612272a66bf4612b06ffa0561b709bbeb3ea55ed9bd28b339211f18'
            '16377958fce36d59c8fcfd9d0e34587ef1d671fd8c0aa79ca510539e1596fef5'
            'f88c92559367ca052427ef090fa934a39753200a029a29b83092309912df36a8'
            'ac2686c9d152af629f3beb2bcf219b8017df37adb8534ab054184c14b5e40b62'
            'ac2686c9d152af629f3beb2bcf219b8017df37adb8534ab054184c14b5e40b62'
            '31808ddcb4925afc0099d0f2b49b3ebf8d24833cb87769505a8f20292ca0fe88')

package()
{

  install -D -m644 "$srcdir/key-project.desktop"         "$pkgdir/usr/share/applications/key-project.desktop"

  install -D -m644 "$srcdir/key-project16.png"           "$pkgdir/usr/share/icons/hicolor/16x16/apps/key-project.png"
  install -D -m644 "$srcdir/key-project32.png"           "$pkgdir/usr/share/icons/hicolor/32x32/apps/key-project.png"
  install -D -m644 "$srcdir/key-project64.png"           "$pkgdir/usr/share/icons/hicolor/64x64/apps/key-project.png"

  mkdir -p "$pkgdir/usr/share/java/key-project"

  install -D -m644 "$srcdir/key-$pkgver-exe.jar"         "${pkgdir}/usr/share/java/key-project/key-project.jar"
  install -D -m755 "$srcdir/key-project"                 "${pkgdir}/usr/bin/key-project"

}

