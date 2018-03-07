# Maintainer: Radek Kiczko < rkiczko at gmail dot com >
# Contributor: Jordan Day < jordanday444 at gmail dot com >

pkgname=butterflight-configurator
pkgver=10.2.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Butterflight flight control system"
arch=('x86_64')
url="https://github.com/ButterFlight/butterflight-configurator"
source=("https://github.com/ButterFlight/butterflight-configurator/releases/download/v$pkgver/butterflight-configurator_"$pkgver"_linux64.zip")
md5sums=('f748036fda7c2bd72930639047792db0')
options=(!strip)
license=('custom')
provides=("$pkgname")

package() {
  mkdir -p "$pkgdir/opt/butterflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Butterflight Configurator/betaflight-configurator.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  cp -r --preserve=all "$srcdir/Butterflight Configurator" "$pkgdir/opt/butterflight/butterflight-configurator"
  ln -s "$pkgdir/opt/butterflight/butterflight-configurator/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

