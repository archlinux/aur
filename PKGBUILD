# Python package author: Christopher Ritsen <chris.ritsen@gmail.com>
_name=netaudio
_pkgname="python-${_name}"
pkgname="${_pkgname}"
_pkgdirname="${_pkgname}"
pkgver=v0.0.3.r3
pkgrel=1
pkgdesc="Control Dante network audio devices without Dante Controller"
arch=(any)
url=""
license=(Unlicense)
depends=("python" "python-cleo" "python-netifaces" "python-pip" "python-twisted" "python-zeroconf")

build() {
  pip install --no-deps --target="netaudio" netaudio==0.0.3
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  mv $srcdir/$_name/bin $pkgdir/usr
  cp -r $srcdir/$_name/* $pkgdir/"$sitepackages"
}
