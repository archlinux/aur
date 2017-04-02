# Maintainer: NexAdn
pkgname=obs-linuxbrowser
pkgver=0.1.1
pkgrel=1
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
depends=("obs-studio>=18.0.1" "libxrandr")
makedepends=("wget" "git")
source=(
    "https://github.com/bazukas/obs-linuxbrowser/releases/download/0.1.0/linuxbrowser${pkgver}-obs18.0.1-64bit.tgz"
)
sha256sums=(
    #"19d0940545fd1ddfc92d35c0ce07e7479d351f13caebeb0e97bbc6836fab58c6"
    "b239af42564275c8cf0e35213de6a4ce76f392d213f9e059b268794dacfb166d"
)
#build() {
    #wget -O $srcdir/$pkgname/data/locale/de_DE.ini https://raw.githubusercontent.com/bazukas/obs-linuxbrowser/master/data/locale/de-DE.ini
#}
package() {
	mkdir -p $pkgdir/$HOME/.config/obs-studio/plugins/obs-linuxbrowser
	cp -R $srcdir/$pkgname/* $pkgdir/$HOME/.config/obs-studio/plugins/obs-linuxbrowser
	chmod -R 0750 $pkgdir/$HOME/.config/
	chmod -R 0755 $pkgdir/$HOME/.config/obs-studio
}
