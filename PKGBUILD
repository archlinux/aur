# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=borked3ds
pkgver=2025.03.11
pkgrel=2
pkgdesc="An experimental Nintendo 3DS Emulator based off of Citra."
arch=(x86_64)
url="https://github.com/Borked3DS/Borked3DS"
license=('GPL-2.0-only')
depends=('glibc' 'qt6-base' 'sdl2' 'qt6-multimedia' 'hicolor-icon-theme' 'libglvnd' 'spirv-tools' 'gcc-libs' 'zydis')
makedepends=('cmake' 'ninja' 'doxygen' 'patchelf' 'git')
_commit=bff691f6d606f29a667a60eebade794cccdee133
source=("$pkgname::git+$url.git#commit=$_commit"
	"boost::git+https://github.com/Borked3DS/ext-boost.git"
	"git+https://github.com/Borked3DS/nihstro.git"
	"git+https://github.com/Borked3DS/soundtouch.git"
	"catch2::git+https://github.com/catchorg/Catch2.git"
	"git+https://github.com/Borked3DS/dynarmic.git"
	"git+https://github.com/herumi/xbyak.git"
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/lsalzman/enet.git"
	"git+https://github.com/benhoyt/inih.git"
	"libressl::git+https://github.com/Borked3DS/ext-libressl-portable.git"
	"git+https://github.com/libusb/libusb.git"
	"git+https://github.com/mozilla/cubeb.git"
	"git+https://github.com/Borked3DS/discord-rpc.git"
	"git+https://github.com/arun11299/cpp-jwt.git"
	"git+https://github.com/Borked3DS/teakra.git"
	"git+https://github.com/lvandeve/lodepng.git"
	"git+https://github.com/facebook/zstd.git"
	"git+https://chromium.googlesource.com/libyuv/libyuv.git"
	"sdl2::git+https://github.com/libsdl-org/SDL.git"
	"git+https://github.com/abdes/cryptopp-cmake.git"
	"git+https://github.com/weidai11/cryptopp.git"
	"git+https://github.com/septag/dds-ktx.git"
	"git+https://github.com/kcat/openal-soft.git"
	"git+https://github.com/KhronosGroup/glslang.git"
	"vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"git+https://github.com/Borked3DS/sirit.git"
	"git+https://github.com/knik0/faad2"
	"library-headers::git+https://github.com/Borked3DS/ext-library-headers.git"
	"git+https://github.com/bylaws/libadrenotools.git"
	"git+https://github.com/Borked3DS/oaknut.git"
	"teakra-old::git+https://github.com/Borked3DS/teakra.git"
	"git+https://github.com/google/oboe.git"
	"git+https://github.com/KhronosGroup/SPIRV-Tools.git"
	"git+https://github.com/KhronosGroup/MoltenVK.git"
	"git+https://github.com/KhronosGroup/Vulkan-ValidationLayers.git"
	"git+https://github.com/libsdl-org/sdl2-compat.git"
	# Submodule submodule
	"git+https://github.com/google/googletest.git"
	"git+https://github.com/arsenm/sanitizers-cmake.git"
	"git+https://github.com/mozilla/cubeb-coreaudio-rs.git"
	"git+https://github.com/mozilla/cubeb-pulse-rs.git"
	# Discord-rpc
	"git+https://github.com/Tencent/rapidjson.git"
	# Dynarmic
	"git+https://github.com/lioncash/biscuit.git"
	"git+https://github.com/Borked3DS/mcl.git"
	"git+https://github.com/Tessil/robin-map.git"
	"zycore::git+https://github.com/zyantific/zycore-c"
	"git+https://github.com/zyantific/zydis.git"
	"git+https://github.com/Borked3DS/unicorn.git"
	# ext-boost, fmt, and catch included above
	# libadrenotools
	"git+https://github.com/bylaws/liblinkernsbypass.git"
	# oaknut has catch
	# sirit has SPIRV-Headers
	"git+https://github.com/KhronosGroup/SPIRV-Headers.git"
	# teakra has xbyak, mcl, robin-map, and catch2
	)
noextract=()
sha256sums=('14dbb3cd908e9584236dd7178701ef94e847eb6334441358bd87496ac9aec343'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {boost,nihstro,soundtouch,catch2,dynarmic,xbyak,fmt,enet,inih,libressl,libusb,cubeb,discord-rpc,cpp-jwt,teakra,lodepng,zstd,libyuv,sdl2,cryptopp-cmake,cryptopp,dds-ktx,openal-soft,glslang,vma,vulkan-headers,sirit,faad2,library-headers,libadrenotools,oaknut,teakra-old,oboe,SPIRV-Tools,MoltenVK,Vulkan-ValidationLayers};
	do
		git config submodule.$submodule.url "$srcdir/$submodule"
	done
	git config submodule.externals/sdl2/sdl2-compat.url "$srcdir/sdl2-compat"
	git -c protocol.file.allow=always submodule update

	pushd externals/cubeb
		git submodule init
		git config submodule.googletest.url "$srcdir/googletest"
		git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
		git config submodule.src/cubeb-coreaudio-rs.git "$srcdir/cubeb-coreaudio-rs"
		git config submodule.src/cubeb-pulse-rs.git "$srcdir/cubeb-pulse-rs"
		git -c protocol.file.allow=always submodule update
	popd
	pushd externals/discord-rpc
		git submodule init
		git config submodule.thirdparty/rapidjson.url "$srcdir/rapidjson"
		git -c protocol.file.allow=always submodule update
	popd
	pushd externals/dynarmic
		git submodule init
		for submodule in {biscuit,fmt,mcl,oaknut,robin-map,xbyak,zycore,zydis,unicorn};
		do
		git config submodule.externals/$submodule.url "$srcdir/$submodule"
		done
		git config submodule.externals/catch.url "$srcdir/catch2"
		git config submodule.externals/ext-boost.url "$srcdir/boost"
		git -c protocol.file.allow=always submodule update
	popd
	pushd externals/libadrenotools
		git submodule init
		git config submodule.lib/linkernsbypass.url "$srcdir/liblinkernsbypass"
		git -c protocol.file.allow=always submodule update
	popd
	pushd externals/oaknut
		git submodule init
		git config submodule.externals/catch.url "$srcdir/catch2"
		git -c protocol.file.allow=always submodule update
	popd
	pushd externals/sirit
		git submodule init
		git config submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
		git -c protocol.file.allow=always submodule update
	popd
	pushd externals/teakra
		git submodule init
		for submodule in {xbyak,mcl,robin-map,catch2};
		do
		git config submodule.externals/$submodule.url "$srcdir/$submodule"
		done
		git -c protocol.file.allow=always submodule update
	popd
}

build() {
	cd "$srcdir"
	export CFLAGS="-U_FORITFY_SOURCE ${CFLAGS}"
	export CXXFLAGS="-U_FORTIFY_SOURCE ${CXXFLAGS}"
	echo $CFLAGS
	echo $CXXFLAGS
	cmake -B build -S "$pkgname" \
	-G Ninja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBORKED3DS_USE_PRECOMPILED_HEADERS=NO \
	-DBORKED3DS_USE_EXTERNAL_VULKAN_SPIRV_TOOLS=NO \
	-DBORKED3DS_WARNINGS_AS_ERRORS=NO

	cmake --build build
}


package() {
	cd "$srcdir"
	for file in {$pkgname,$pkgname-cli,$pkgname-room};
	do
		install -Dm755 "$srcdir/build/bin/None/$file" "$pkgdir/usr/bin/$file"
	done

	install -Dm644 "$srcdir/$pkgname/dist/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -Dm644 "$srcdir/$pkgname/dist/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname/dist/$pkgname.6" "$pkgdir/usr/share/man/man6/$pkgname.6"
	patchelf --remove-rpath "$pkgdir/usr/bin/$pkgname"
	patchelf --remove-rpath "$pkgdir/usr/bin/$pkgname-cli"
}
