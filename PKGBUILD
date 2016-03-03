# Maintainer: Xeechou <xeechou@gmail.com>


_pkgname=inconsolata-psf
pkgname=${_pkgname}-git
pkgver=0.1
pkgrel=1
pkgdesc="Inconsolata fonts in PSF format"
arch=('any')
url=""
license=('custom')
groups=()
depends=()
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=()
install=
source=("$_pkgname::git+https://github.com/xeechou/Inconsolata-psf.git")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'



build() {
  cd "$srcdir/$_pkgname"
  msg "Starting build..."
  for f in *.psf; do
  echo "compress $f"
  gzip $f
done
}

package() {
  msg "Starting install..."
  cd "$srcdir/$_pkgname"
  for f in *.psf.gz; do
      install -D -m644 "$f" "${pkgdir}/usr/share/kbd/consolefonts/$f"
done
}

# vim:set ts=2 sw=2 et:
