### Based on "ntopng-bin" from the aur(https://aur.archlinux.org/packages/ntopng-bin)
# Maintainer: 		EndlessEden <endlesseden@users.noreply.github.com>

pkgname="nprobe-bin"
# to update visit https://packages.ntop.org/apt/bookworm/x64/ and keep track of the latest pkgver, date and build
_pkgverAmd64=10.9
_dateAmd64=250930
_buildAmd64=8634
# to update visit https://packages.ntop.org/apt/bookworm_pi/arm64/ and keep track of the latest pkgver, date and build
_pkgverArm64=10.9
_dateArm64=250930
_buildArm64=8634
# to update visit https://packages.ntop.org/apt/buster_pi/armhf/ and keep track of the latest pkgver, date and build
_pkgverArm32=10.5
_dateArm32=240707
_buildArm32=8348
# updated automatically
pkgver="$_pkgverAmd64.$_dateAmd64"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="https://www.ntop.org/"
license=("GPL3")
arch=("x86_64" "armv7h" "aarch64")
provides=("nprobe")
conflicts=("nprobe" "nprobe-git")
makedepends=("binutils")
depends=("hiredis"
         "libcap"
         "libmariadbclient"
         "libmaxminddb"
         "rrdtool"
         "sqlite"
         "zeromq")
#optdepends=("nprobe-data")
source_x86_64=("https://packages.ntop.org/apt/bookworm/x64/nprobe_${_pkgverAmd64}.${_dateAmd64}-${_buildAmd64}_amd64.deb"
"https://packages.ntop.org/apt/bookworm/x64/nprobes_${_pkgverAmd64}.${_dateAmd64}-${_buildAmd64}_amd64.deb"
"https://packages.ntop.org/apt/bookworm/x64/nprobe-dev_${_pkgverAmd64}.${_dateAmd64}-${_buildAmd64}_amd64.deb")
source_aarch64=("https://packages.ntop.org/apt/bookworm_pi/arm64/nprobe_${_pkgverArm64}.${_dateArm64}-${_buildArm64}_arm64.deb")
source_armv7h=("https://packages.ntop.org/apt/buster_pi/armhf/nprobe_${_pkgverArm32}.${_dateArm32}-${_buildArm32}_armhf.deb")
b2sums_x86_64=('c9e1fe308de70ab614239851e2e78a3a8ab7f039d7afda21bf106ca0753001789ab512ae79a9610664a5f472952facfda76db5898839fd72470dfd5ae38a5d95'
               '618141c69810281e53fee57fa77df73cfbe4b7b204aa49c6e53ebb24be93519e7a8998aff41ed7f644d48db4e12a574d958b5473e55e877e0f6657d84ec85a44'
               '3e702660ed9bd29e3fc3f6d8935508c94b17ca70c0fbbf3890ae3ab9721afba18c5ae99408528a4e874c54e659e76ef818c347384032b014a76ad8497423a928')
b2sums_armv7h=('94eff1fcde757550a1325693ed0551834aec89cefee4dfd9cdf1cea715046b84ee06614bb1a31c7503a9e857561790036dabae422074208e57ec6ba865bbc757')
b2sums_aarch64=('02b481b93bf6111611d8942bb4b737cd4f9daab18c01a2a943d8e398f387f3814266360ece5e3cc1bddb8e3445dc68dff52f4ccd1b85c48e35ab22e237297850')
options=("!strip")

prepare(){
 if [ "$arch" == "x86_64" ]; then
	mkdir -p "$srcdir"/nprobe_"$_pkgverAmd64"_"$_dateAmd64"_"$_buildAmd64"_"amd64" && cd "$srcdir"/nprobe_"$_pkgverAmd64"_"$_dateAmd64"_"$_buildAmd64"_"amd64"/
	ar -x "$srcdir"/../nprobe_"$_pkgverAmd64"."$_dateAmd64"-"$_buildAmd64"_"amd64".deb
	tar -xf "data.tar.xz"
	rm control.tar.xz  data.tar.xz  debian-binary
	mkdir -p "$srcdir"/nprobes_"$_pkgverAmd64"_"$_dateAmd64"_"$_buildAmd64"_"amd64" && cd "$srcdir"/nprobes_"$_pkgverAmd64"_"$_dateAmd64"_"$_buildAmd64"_"amd64"/
	ar -x "$srcdir"/../nprobes_"$_pkgverAmd64"."$_dateAmd64"-"$_buildAmd64"_"amd64".deb
	tar -xf "data.tar.xz"
	rm control.tar.xz  data.tar.xz  debian-binary
	mkdir -p "$srcdir"/nprobe-dev_"$_pkgverAmd64"_"$_dateAmd64"_"$_buildAmd64"_"amd64" && cd "$srcdir"/nprobe-dev_"$_pkgverAmd64"_"$_dateAmd64"_"$_buildAmd64"_"amd64"/
	ar -x "$srcdir"/../nprobe-dev_"$_pkgverAmd64"."$_dateAmd64"-"$_buildAmd64"_"amd64".deb
	tar -xf "data.tar.xz"
	rm control.tar.xz  data.tar.xz  debian-binary
 fi
 if [ "$arch" == "aarch64" ]; then
	mkdir -p "$srcdir"/nprobe_"$_pkgverArm64"_"$_dateArm64"_"$_buildArm64"_"arm64" && cd "$srcdir"/nprobe_"$_pkgverArm64"_"$_dateArm64"_"$_buildArm64"_"arm64"
	ar -x "$srcdir"/../nprobe_"$_pkgverArm64"."$_dateArm64"-"$_buildArm64"_"arm64".deb
	tar -xf "data.tar.xz"
	rm control.tar.xz  data.tar.xz  debian-binary
 fi
 if [ "$arch" == "armv7h" ]; then
	mkdir -p "$srcdir"/nprobe_"$_pkgverArm32"_"$_dateArm32"_"$_buildArm32"_"armhf" && cd "$srcdir"/nprobe_"$_pkgverArm32"_"$_dateArm32"_"$_buildArm32"_"armhf"
	ar -x "$srcdir"/../nprobe_"$_pkgverArm32"."$_dateArm32"-"$_buildArm32"_"armhf".deb
	tar -xf "data.tar.xz"
	rm control.tar.xz  data.tar.xz  debian-binary
 fi
 #tar -xf "data.tar.xz"
}

package(){
 # program files *(and systemd & development headers)
 if [ "$arch" == "x86_64" ]; then
	cd "$srcdir"/nprobe_"$_pkgverAmd64"_"$_dateAmd64"_"$_buildAmd64"_"amd64"/
		cp -r "usr" "$pkgdir"
		cp -r "etc" "$pkgdir"
	cd "$srcdir"/nprobes_"$_pkgverAmd64"_"$_dateAmd64"_"$_buildAmd64"_"amd64"/
		cp -r "usr" "$pkgdir"
	cd "$srcdir"/nprobe-dev_"$_pkgverAmd64"_"$_dateAmd64"_"$_buildAmd64"_"amd64"/
		cp -r "usr" "$pkgdir"
 fi
 if [ "$arch" == "aarch64" ]; then
	cd "$srcdir"/nprobe_"$_pkgverArm64"_"$_dateArm64"_"$_buildArm64"_"arm64"/
		cp -r "usr" "$pkgdir"
		cp -r "etc" "$pkgdir"
 fi
 if [ "$arch" == "armv7h" ]; then
	cd "$srcdir"/nprobe_"$_pkgverArm32"_"$_dateArm32"_"$_buildArm32"_"armhf"/
		cp -r "usr" "$pkgdir"
		cp -r "etc" "$pkgdir"
 fi
 # systemd files -- need to implement this later. 
 #install -D -m 644 "nprobe.sysusers" "$pkgdir/usr/lib/sysusers.d/nprobe.conf"
 #install -D -m 644 "nprobe.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/nprobe.conf"
 #install -D -m 644 "nprobe@.service" "$pkgdir/usr/lib/systemd/system/nprobe@.service"
}
