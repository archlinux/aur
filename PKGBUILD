# Maintainer: SpacingBat3 <git@spacingbat3.anonaddy.com>

# ============================================================================ #
#
# This PKGBUILD is also a convenient template for other `rhvoice-voice-*'
# packages: you might only need to replace `$pkgver`, `$license` `$_vname`,
# `$_vlang`, `$_vcode` and update the checksums in order to use it for other
# voices.
#
# If you plan to use it in other PKGBUILD you'd want to maintain, please leave
# comments containing information about previous maintainers and contributors
# as-is, only replacing the "Maintainer" to "Contributor" as referenced in
# AUR submission guidelines in ArchWiki:
#
# <https://wiki.archlinux.org/title/AUR_submission_guidelines#Rules_of_submission>
#
# ============================================================================ #

###### [ ---------------- SECTION 1: Package metadata ----------------- ] ######

### SECTION 1.1: Tweakable or updateable metadata

_vname=Cezary
_vlang=Polish
_vcode=pol

pkgver=4.1
pkgrel=1
license=('custom:CC-BY-NC-ND-4.0')

### SECTION 1.2: Auto-generated or hardcoded metadata

_vpown=RHVoice
_vshort="${_vname,,}"
_vgroup="${_vpown,,}"
_vproj="$_vshort-$_vcode"

pkgname="$_vgroup-voice-$_vshort"
pkgdesc="$_vpown '$_vname' voice for $_vlang language"
arch=('any')
url="https://github.com/$_vpown/$_vproj"
groups=("$_vgroup")
depends=("$_vgroup-language-${_vlang,,}")

### SECTION 1.3: Package sources and their checksums

source=("$pkgname-$pkgver.zip::https://github.com/$_vpown/$_vproj/releases/download/$pkgver/$_vpown-voice-$_vlang-$_vname-v$pkgver.zip")
md5sums=('27015f117f264509ff23c9e793a4ceb7')
sha512sums=('9c653ad88528b33eba5b8a618749856c2d0a903375a0ef9308e8558ae10dbe471960800f98934edc315d84d25978270776dffc82feb223cb0ecc24477709f5fc')
b2sums=('64521ea40c5f9581d11f861317b890331307c58d7e4c04b4521c5bc24604f9f4f37f28fc7ad0ea86bccd7a0a11f8415ade6b040330f0da421ee4562c8b1c2c10')

###### [ -------------- SECTION 2: Function declarations -------------- ] ######

package() {
	_install_dir="$pkgdir/usr/share/$_vpown/voices/$_vshort/"
	cd "$srcdir"
	install -vDm644 16000/* -t "$_install_dir/16000/"
	install -vDm644 24000/* -t "$_install_dir/24000/"
	install -vDm644 voice.{info,params} -t "$_install_dir"
	install -vDm644 'license' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
