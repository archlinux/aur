# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
_pkgbasename=gx-lv2
pkgname=${_pkgbasename}-git
pkgver=0.8
pkgrel=4
pkgdesc="Additional Guitarix effects in LV2 format"
arch=('i686' 'x86_64')
url="https://github.com/brummer10?tab=repositories"
license=('GPL3')
depends=('libsndfile' 'gtk2')
makedepends=('git' 'lv2' 'libxext' 'freetype2')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("git://github.com/brummer10/GxUVox720k.lv2.git"
"git://github.com/brummer10/GxVmk2.lv2.git"
"git://github.com/brummer10/GxHyperion.lv2.git"
"git://github.com/brummer10/GxSwitchlessWah.lv2.git"
"git://github.com/brummer10/GxSuperFuzz.lv2.git"
"git://github.com/brummer10/GxSaturator.lv2.git"
"git://github.com/brummer10/GxSlowGear.lv2.git"
"git://github.com/brummer10/GxVoodoFuzz.lv2.git"
"git://github.com/brummer10/GxVintageFuzzMaster.lv2.git"
"git://github.com/brummer10/GxGuvnor.lv2.git"
"git://github.com/brummer10/GxSuppaToneBender.lv2.git"
"git://github.com/brummer10/screcord.lv2.git"
"git://github.com/brummer10/GxToneMachine.lv2"
"git://github.com/brummer10/GxVBassPreAmp.lv2"
"git://github.com/brummer10/GxBottleRocket.lv2"
"git://github.com/brummer10/GxHotBox.lv2")
sha256sums=('SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP')

#pkgver() {
#  cd "${srcdir}/${_pkgbasename}"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
	cd "${srcdir}"
		for i in $( ls ); do
			echo building: $i
			cd $i
			make
			cd ..
		done
}

package() {
  	cd "${srcdir}"
		for i in $( ls ); do
			echo installing: $i
			cd $i
			make DESTDIR="${pkgdir}" install
#			install -d "$pkgdir/usr/lib/lv2"
#			cp -R *.lv2 "$pkgdir/usr/lib/lv2"
			cd ..
		done
}

