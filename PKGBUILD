_pkgname="xamarin-android"
pkgname=("${_pkgname}-git")
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages such as C#. (git version)"
pkgver=0
pkgrel=0
arch=('x86_64')
url="https://github.com/xamarin/xamarin-android"
license=('MIT')
depends=(
	'mono>=5.18'
	'java-environment=8'
	'gtk-sharp-2' 'libzip' 'referenceassemblies-pcl' 'unzip' 'zip'
	# these should be reused, but it looks like makefile doesn't care
	#'android-ndk' 'android-sdk'
 	#"android-platform-"{} 
	#"android-x86-64-system-image-"{}
	#'android-support-repository'
	#'apache-ant'
	#base-devel: autoconf (autotools)
	)
makedepends=(
	'git'
	'cmake' 'gdk-pixbuf2' 'wget'
	'lsb-release' 'openssh'
	'nuget' 'msbuild'
	# these should be also reused, but the same happens
	#'llvm' 'nuget'
	)
_android_repo='https://dl.google.com/android/repository'
_apache_repo='https://archive.apache.org/dist/ant/binaries'
_ndk_ver='19c'
_build_ver='28.0.3'
_plat_ver='28.0.2'
_emu_ver='5395263'
_cmake_ver='3.10.2'
source=(
	"${_pkgname}::git+${url}.git"
	'ext_debugger-libs::git+git://github.com/mono/debugger-libs.git'
	'ext_dlfcn-win32::git+https://github.com/dlfcn-win32/dlfcn-win32.git#tag=v1.1.1'
	'ext_Java.Interop::git+https://github.com/xamarin/java.interop.git'
	'ext_libzip::git+https://github.com/nih-at/libzip.git#tag=rel-1-5-1'
	'ext_LibZipSharp::git+https://github.com/grendello/LibZipSharp.git'
	'ext_llvm::git+https://github.com/mono/llvm.git#branch=release_60'
	'ext_mman-win32::git+https://github.com/witwall/mman-win32.git'
	'ext_mono::git+https://github.com/mono/mono.git#branch=2018-10'
	'ext_mxe::git+https://github.com/xamarin/mxe.git#branch=xamarin'
	'ext_nrefactory::git+git://github.com/icsharpcode/NRefactory.git'
	'ext_opentk::git+https://github.com/mono/opentk.git'
	'ext_proguard::git+https://github.com/xamarin/proguard.git'
	'ext_sqlite::git+https://github.com/xamarin/sqlite.git#branch=3.27.1'
	'ext_xamarin-android-api-compatibility::git+https://github.com/xamarin/xamarin-android-api-compatibility.git'
	'ext_xamarin-android-tools::git+https://github.com/xamarin/xamarin-android-tools'

	'ext_aspnetwebstack::git+git://github.com/mono/aspnetwebstack.git'
	'ext_Newtonsoft.Json::git+git://github.com/mono/Newtonsoft.Json.git'
	'ext_cecil::git+git://github.com/mono/cecil.git'
	'ext_rx::git+git://github.com/mono/rx.git#branch=rx-oss-v2.2'
	'ext_ikvm::git+git://github.com/mono/ikvm-fork.git'
	'ext_ikdasm::git+git://github.com/mono/ikdasm.git'
	'ext_reference-assemblies::git+git://github.com/mono/reference-assemblies.git'
	'ext_nunit-lite::git+git://github.com/mono/NUnitLite.git'
	'ext_nuget-buildtasks::git+git://github.com/mono/NuGet.BuildTasks'
	'ext_cecil-legacy::git+git://github.com/mono/cecil.git#branch=mono-legacy-0.9.5'
	'ext_boringssl::git+git://github.com/mono/boringssl.git#branch=mono'
	'ext_corefx::git+git://github.com/mono/corefx.git'
	'ext_bockbuild::git+git://github.com/mono/bockbuild.git'
	'ext_linker::git+git://github.com/mono/linker.git'
	'ext_roslyn-binaries::git+git://github.com/mono/roslyn-binaries.git'
	'ext_corert::git+git://github.com/mono/corert.git'
	'ext_xunit-binaries::git+git://github.com/mono/xunit-binaries.git'
	'ext_api-doc-tools::git+git://github.com/mono/api-doc-tools.git'
	'ext_api-snapshot::git+git://github.com/mono/api-snapshot.git'
	
	"${_android_repo}/android-ndk-r$(_ndk_ver)-linux-x86_64.zip"
	"${_android_repo}/build-tools_r${_build_ver}-linux.zip"
	"${_android_repo}/platform-tools_r${_plat_ver}-linux.zip"
	"${_android_repo}/sdk-tools-linux-4333796.zip"
	"${_android_repo}/emulator-linux-${_emu_ver}.zip"
	"${_android_repo}/cmake-${_cmake_ver}-linux-x86_64.zip"
	"${_android_repo}/android-2.3.3_r02-linux.zip"
	"${_android_repo}/android-15_r03.zip"
	"${_android_repo}/android-16_r04.zip"
	"${_android_repo}/android-17_r02.zip"
	"${_android_repo}/android-18_r02.zip"
	"${_android_repo}/android-19_r03.zip"
	"${_android_repo}/android-20_r02.zip"
	"${_android_repo}/android-21_r02.zip"
	"${_android_repo}/android-22_r02.zip"
	"${_android_repo}/platform-23_r03.zip"
	"${_android_repo}/platform-24_r02.zip"
	"${_android_repo}/platform-25_r03.zip"
	"${_android_repo}/platform-26_r02.zip"
	"${_android_repo}/platform-27_r03.zip"
	"${_android_repo}/platform-28_r04.zip"
	"${_android_repo}/platform-Q_r02.zip"
	"${_android_repo}/docs-24_r01.zip"
	"${_android_repo}/android_m2repository_r16.zip"
	"${_android_repo}/sys-img/android/x86-28_r04.zip"
	"${_apache_repo}/apache-ant-1.9.9-bin.zip"
	)
noextract=(
	"android-ndk-r$(_ndk_ver)-linux-x86_64"
	"build-tools_r${_build_ver}-linux.zip"
	"platform-tools_r${_plat_ver}-linux.zip"
	'sdk-tools-linux-4333796.zip'
	"emulator-linux-${_emu_ver}.zip"
	"cmake-${_cmake_ver}-linux-x86_64.zip"
	'android-2.3.3_r02-linux.zip'
	'android-15_r03.zip'
	'android-16_r04.zip'
	'android-17_r02.zip'
	'android-18_r02.zip'
	'android-19_r03.zip'
	'android-20_r02.zip'
	'android-21_r02.zip'
	'android-22_r02.zip'
	'platform-23_r03.zip'
	'platform-24_r02.zip'
	'platform-25_r03.zip'
	'platform-26_r02.zip'
	'platform-27_r03.zip'
	'platform-28_r04.zip'
	'platform-Q_r02.zip'
	'docs-24_r01.zip'
	'android_m2repository_r16.zip'
	'x86-28_r04.zip'
	'apache-ant-1.9.9-bin.zip'
	)
sha256sums=()
for i in "${source[@]}"; do sha256sums+=('SKIP'); done

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}"
	
	mkdir -p cache
	mv "android-ndk-r$(_ndk_ver)-linux-x86_64.zip" \
		"build-tools_r${_build_ver}-linux.zip" \
		"platform-tools_r${_plat_ver}-linux.zip" \
		'sdk-tools-linux-4333796.zip' \
		"emulator-linux-${_emu_ver}.zip" \
		"cmake-${_cmake_ver}-linux-x86_64.zip" \
		'android-2.3.3_r02-linux.zip' \
		'android-15_r03.zip' \
		'android-16_r04.zip' \
		'android-17_r02.zip' \
		'android-18_r02.zip' \
		'android-19_r03.zip' \
		'android-20_r02.zip' \
		'android-21_r02.zip' \
		'android-22_r02.zip' \
		'platform-23_r03.zip' \
		'platform-24_r02.zip' \
		'platform-25_r03.zip' \
		'platform-26_r02.zip' \
		'platform-27_r03.zip' \
		'platform-28_r04.zip' \
		'platform-Q_r02.zip' \
		'docs-24_r01.zip' \
		'android_m2repository_r16.zip' \
		'x86-28_r04.zip' \
		'apache-ant-1.9.9-bin.zip' \
		./cache/

	cd "${_pkgname}"
	git submodule init
	git config submodule.external/debugger-libs.url "$srcdir/ext_debugger-libs"
	git config submodule.external/dlfcn-win32.url "$srcdir/ext_dlfcn-win32"
	git config submodule.external/Java.Interop.url "$srcdir/ext_Java.Interop"
	git config submodule.external/libzip.url "$srcdir/ext_libzip"
	git config submodule.external/LibZipSharp.url "$srcdir/ext_LibZipSharp"
	git config submodule.external/llvm.url "$srcdir/ext_llvm"
	git config submodule.external/mman-win32.url "$srcdir/ext_mman-win32"
	git config submodule.external/mono.url "$srcdir/ext_mono"
	git config submodule.external/mxe.url "$srcdir/ext_mxe"
	git config submodule.external/nrefactory.url "$srcdir/ext_nrefactory"
	git config submodule.external/opentk.url "$srcdir/ext_opentk"
	git config submodule.external/proguard.url "$srcdir/ext_proguard"
	git config submodule.external/sqlite.url "$srcdir/ext_sqlite"
	git config submodule.external/xamarin-android-api-compatibility.url "$srcdir/ext_xamarin-android-api-compatibility"
	git config submodule.external/xamarin-android-tools.url "$srcdir/ext_xamarin-android-tools"
	git submodule update

cat <<EOF > Configuration.Override.props
<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <AndroidToolchainCacheDirectory>${srcdir}\cache</AndroidToolchainCacheDirectory>
    <AndroidToolchainDirectory>${srcdir}\cache\toolchain</AndroidToolchainDirectory>
    <AndroidMxeInstallPrefix>\$(AndroidToolchainDirectory)\mxe</AndroidMxeInstallPrefix>
  </PropertyGroup>
</Project>
EOF

	pushd 'external/mono'
	git submodule init
	git config submodule.external/aspnetwebstack.url "$srcdir/ext_aspnetwebstack"
	git config submodule.external/Newtonsoft.Json.url "$srcdir/ext_Newtonsoft.Json"
	git config submodule.external/cecil.url "$srcdir/ext_cecil"
	git config submodule.external/rx.url "$srcdir/ext_rx"
	git config submodule.external/ikvm.url "$srcdir/ext_ikvm"
	git config submodule.external/ikdasm.url "$srcdir/ext_ikdasm"
	git config submodule.external/reference-assemblies.url "$srcdir/ext_reference-assemblies"
	git config submodule.external/nunit-lite.url "$srcdir/ext_nunit-lite"
	git config submodule.external/nuget-buildtasks.url "$srcdir/ext_nuget-buildtasks"
	git config submodule.external/cecil-legacy.url "$srcdir/ext_cecil-legacy"
	git config submodule.external/boringssl.url "$srcdir/ext_boringssl"
	git config submodule.external/corefx.url "$srcdir/ext_corefx"
	git config submodule.external/bockbuild.url "$srcdir/ext_bockbuild"
	git config submodule.external/linker.url "$srcdir/ext_linker"
	git config submodule.external/roslyn-binaries.url "$srcdir/ext_roslyn-binaries"
	git config submodule.external/corert.url "$srcdir/ext_corert"
	git config submodule.external/xunit-binaries.url "$srcdir/ext_xunit-binaries"
	git config submodule.external/api-doc-tools.url "$srcdir/ext_api-doc-tools"
	git config submodule.external/api-snapshot.url "$srcdir/ext_api-snapshot"
	git submodule update
	popd

	NO_SUDO=true make prepare MSBUILD=msbuild
}

build() {
	cd "${srcdir}/${_pkgname}"
	NO_SUDO=true make MSBUILD=msbuild all
}

package() {
	cd "${srcdir}/${_pkgname}"
	make prefix="${pkgdir}/opt/xamarin-android" install
}

