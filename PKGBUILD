# Python package author: Christopher Ritsen <chris.ritsen@gmail.com>
_name=netaudio
_pkgname="python-${_name}"
pkgname="${_pkgname}"
_pkgdirname="${_pkgname}"
pkgver=0.0.3
pkgrel=2
pkgdesc="Control Dante network audio devices without Dante Controller"
arch=(any)
url="https://github.com/chris-ritsen/network-audio-controller"
license=(Unlicense)
depends=("python" "python-cleo" "python-netifaces" "python-pip" "python-twisted" "python-zeroconf")

build() {
  pip install --no-deps --target="netaudio" netaudio=="$pkgver"
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  mv $srcdir/$_name/bin $pkgdir/usr
  cp -r $srcdir/$_name/* $pkgdir/"$sitepackages"
}
