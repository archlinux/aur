# Maintainer: Alex Nowhere < nowhere at protonmail dot ch >
# This is package is fork of https://aur.archlinux.org/packages/butterflight-configurator/
# RC version of butterflight-configurator (Release Candidate).
# Package will be updated with the advent of new versions. checking of updates daily.

pkgname=butterflight-configurator-rc
pkgver=10.4.3
pkgsuffix=-rc
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Butterflight flight control system. Release Candidate."
arch=('x86_64')
url="https://github.com/ButterFlight/butterflight-configurator"
source=("https://github.com/ButterFlight/butterflight-configurator/releases/download/v$pkgver${pkgsuffix^^}/butterflight-configurator_"$pkgver"_linux64.zip")
md5sums=('7a35c9b010639a45d0ea08a342156cf4')
options=(!strip)
license=('custom')
provides=("$pkgname")

package() {
  mkdir -p "$pkgdir/opt/butterflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Butterflight Configurator/betaflight-configurator.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  cp -r --preserve=all "$srcdir/Butterflight Configurator" "$pkgdir/opt/butterflight/butterflight-configurator-rc"
  ln -s "$pkgdir/opt/butterflight/butterflight-configurator-rc/${pkgname%"$pkgsuffix"}" "$pkgdir/usr/bin/$pkgname"
}

