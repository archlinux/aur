# Maintainer: Cody Schafer <aur@codyps.com>
pkgname=sigrok-firmware-dreamsourcelab-dslogic
pkgver=0.97
pkgrel=2
pkgdesc="Firmware for DreamsourceLab DSLogic & DScope logic analyzers"
arch=(any)
url=""
license=('GPL')
groups=()
depends=()
_bs='https://github.com/DreamSourceLab/DSView/raw/886b847c21c606df3138ce7ad8f8e8c363ee758b/DSView/res'
source=(
	"$_bs/DSLogic50.bin"
	"$_bs/DSLogic33.bin"
	"$_bs/DSLogic.fw"
	"$_bs/DSCope.bin"
	"$_bs/DSCope.fw"
	"$_bs/DSLogicPro.bin"
	"$_bs/DSLogicPro.fw"
	"$_bs/DSLogicPlus.bin"
	"$_bs/DSLogicPlus.fw"
	"$_bs/DSLogicBasic.bin"
	"$_bs/DSLogicBasic.fw"
)
noextract=()
md5sums=('c3735b82e8b2b8310bec9c2c05ea8b47'
         '1599ee538d3ff99ddc014b0243cbf60d'
         '80db51aabc377cb215df2f213621355f'
         '80a64ccd9ce8ee71a7165a27dbb30ede'
         '4a2ab71e1ef726e2e65019f9d42a6e50'
         '1adf30ff49522cf6944e67b19a8736ed'
         '0555bf649719d11e714f159f2fdc5a57'
         '0ebc84bf40cf1f9c60998794bc3dba1f'
         '6f1805fcb5040498ae1b522a7defae5d'
         '3d19924ab211967c2496681fce9e17ed'
         'ab6f5788ce7228ab26933a3cda7abc7b')

package() {
	_f=$pkgdir/usr/share/sigrok-firmware
	_b="$_f/dreamsourcelab-dslogic"
	install -d "$_f"
	install DSLogic50.bin "$_b-fpga-5v.fw"
	install DSLogic33.bin "$_b-fpga-3v3.fw"
	install DSLogic.fw    "$_b-fx2.fw"

	install DSLogicPro.bin    "$_b-pro-fpga.fw"
	install DSLogicPro.fw     "$_b-pro-fx2.fw"

	install DSLogicPlus.bin    "$_b-plus-fpga.fw"
	install DSLogicPlus.fw     "$_b-plus-fx2.fw"

	install DSLogicBasic.bin   "$_b-basic-fpga.fw"
	install DSLogicBasic.fw    "$_b-basic-fx2.fw"

	install DSCope.bin "$_f/dreamsourcelab-dscope-fpga.fw"
	install DSCope.fw  "$_f/dreamsourcelab-dscope-fx2.fw"
}
