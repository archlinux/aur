# Maintainer: Hossein Heydari <arch7nelliel@gmail.com>
pkgname=python-youtube-dl
pkgver=2020.2.16
pkgrel=1
pkgdesc="YouTube video downloader"
arch=(any)
url="https://github.com/ytdl-org/youtube-dl"
license=(GPLv3)
makedepends=("python" "python-pip")

build() {
  pip install --no-deps --target="youtube-dl" youtube-dl==2020.2.16
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/youtube-dl/* $pkgdir/"$sitepackages"
}
