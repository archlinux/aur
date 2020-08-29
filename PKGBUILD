# Maintainer: Antoine Damhet <xdbob at lse.epita.fr>
# Original-Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

_pkgname=obs-studio
pkgname=$_pkgname-wayland
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgver=25.0.8
pkgrel=4
pkgdesc="Free, open source software for live streaming and recording (with wayland patches)"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
         'qt5-svg' 'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264' 'vlc' 'swig' 'python' 'luajit')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'vlc: VLC Media Source support'
            'wlrobs-hg: screen capture on wlroots compositors')
source=(
  $_pkgname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz
  https://github.com/obsproject/obs-studio/commit/8a1429e29ebd6bf31ad6ae63c6992e2c03893767.patch
  0001-deps-glad-Add-EGL.patch
  0002-libobs-opengl-Rename-gl-x11.c-to-gl-x11-glx.c.patch
  0003-libobs-opengl-Factor-out-GLX-winsys.patch
  0004-libobs-opengl-Introduce-the-X11-EGL-winsys.patch
  0005-deps-glad-Make-X11-required-as-well.patch
  0006-ci-Install-qtbase5-private-dev-on-Linux.patch
  0007-libobs-nix-Move-X11-specific-code-to-obs-nix-x11.c.patch
  0008-libobs-Introduce-the-concept-of-a-Unix-platform.patch
  0009-UI-Set-the-Unix-platform-on-startup.patch
  0010-linux-capture-Fail-to-load-when-running-on-EGL.patch
  0011-libobs-Add-a-Wayland-platform.patch
  0012-libobs-opengl-Try-to-use-the-platform-display-if-ava.patch
  0013-libobs-opengl-Introduce-an-EGL-Wayland-renderer.patch
  0014-UI-Retrieve-Wayland-surface-from-QWindow.patch
  0015-UI-Destroy-display-when-becoming-invisible.patch
  0016-UI-Don-t-create-obs_display-when-QTToGSWindow-fails.patch
  0017-UI-Rename-callback-to-match-signal-name.patch
  0018-UI-Disable-and-ignore-Always-On-Top-on-Wayland-platf.patch
  0019-UI-Make-OBSQTDisplay-CreateDisplay-public-and-allow-.patch
  0020-UI-Check-for-Expose-and-PlatformSurface-events-to-cr.patch
)
sha512sums=('a97c03dc218a4e03e48f6a7dc82b4a59ebeee2039f17be66bb847681ce9ff3d25e6e015be4af78fe44739f6fad5089b6e683d7657c2e4fde8e547df9a2594a08'
            '1ff0e088eed61554268009f3d8c5a23c0888bfbe860d6cb288ddf348108446c152fd87e2cb8f54613a88378d8474550632c90f924005d5e0343bf1a801339ccc'
            'c322fb6dbe90bd3b9d298867731388ef306f3dbf038b2cb0f3f262c52981200ae949db6917b50c751b6920a40eef4b4fa8108ef5db9b83575ff3556024fa8f79'
            '78670b678538cc43cc484e377c14bce6a55cb36be00c8db485e1e084b6eafd1833cae376b1f618b329dd2c4d50fa1de53c6bf252932edce97253f4b19f229500'
            '9aaf118e233d6e7eda5f72b77eefedb641e11ddf0daff0463ae25cc4440de8e52903813215ec6bf33f82eb3c11febd166ce3859bfbe4044cd5e09a018ceb391c'
            '662438ef6e95dc8262403c931c8a749a6204bf4857f76e6fccee5084dcbe2ca693309ca078170e25d13be1cfd4d4a8746cbfc318c473d0ea52b332adb5e90c61'
            'c2be03913d95f8f449c9c9df6df8be41956923baf28f30091dc9a836c9e37d4e84ee930730edf2d3cc162886809d3a42e0fd4d79fd84f27a77c9e08802de6947'
            '9b4722003418f27cbe7efed102b1a69aeb1cb9782d4249b14a7a7f10d0bce725465bda459cfd77e0e577e93f46b2ca0604f48c9a3c19e4a7b0d31b3386f0a8cf'
            '854482e4dc52293b2b488988bc05fa1835346780aa0213e4e102ece971d630fadc33d5941424673050eed7b5aba017cebe3248e62f3fb69483f389bca7aede39'
            '8c5a049babe4804ab2b701591ab2ed9e597e974279431d728461807df5a37361164ce21b36d832017daa6e967bac545dc7c25f17433f4f6eef9c937da35ede34'
            '5055c4bdd282743e7971be8eccce627eb0e1eb607bdf7f306748cd7898fcf08eaf64d870e753940682dac1691a6c959a539a032bae104b9d1a6fe4ca2e16187f'
            '00b1909e225e479483fd1b23053dbff5630526d927e5df7eb9fe3c340f27bf343d64796ee66e37b4e7f3f6bab8649ad93fa76b6b2a4628e31b1894cab417f247'
            '5b33e379d789ae1e17354a210531498765ee64773f0a457f505de480b10c9adfa9116e121e8a31757fbc0bc241c71fd9921ac796b7c4b038f4dea2cf0a04aa48'
            'b0b9d213d39cbcfdbb83f61352c8488b6a95d414f4299d6e7e729aa485f911d60ef4f047ca13d006dc77b1c43a7f49db381fec5c1e695e3ec9da0e6eab99bb61'
            '6dee9847d4d98704f393f1f788f2a0c22b630a3e4021846afa356ba2bb4be664e0b6e0f4b3ee2e58d889e7d33a90b516b91ad6bc6b2c241c22245be68ca098b7'
            '01953fc6cd1a5789a6fa5be076da53ba5e8f56418b9f2badca3af6221acf72107e4f73a06a082b20894fdd18aa5263668411d72f4ef237af81f3f2ed86a63be8'
            'e5ad79d67b15b5b245b8f06da0321d221d47aa91297b2c8a6c941c2a49b78e413edf3c6fac08bdcf573fa4cdf1632d8ba1b1ad5697ae67ece96b0fd1f4264a91'
            '7b93c07e21efc66ef444db68e25b4f66e7b3acd111b70dc8c6c39a6ebcff29b3238a749693134a59d568757732c93a8c39f1624686161b967828f6ef267b4ac6'
            'ff4e3e8b463a054df5a9b57b670971d2ba4dd4345e0cf7455d2d1d4dd8d911390533fdd42bfd027c3726a717e91ebb0cdf8855f47be065581179fa225f831d22'
            '4fe456675224ab8692828ef022aae35899027ecbc98c70c47621e9b0e9839b332a5b1548736515ae09b3fcbe46ad17c35cd1338310d96e68db3337cc9dc2a2ee'
            'e1358bdb7455aeae737c33a9180e225de288a25df16337ab2ed2a51e8ca6df66d89b863d1539a43a3c409b372a19cdbb5be37f842fc9320fb7046eabf69fcaba'
            'cd3ab0c4c71e7c289732530dfb3230ebb35a4021335b3a0ad9bce5ec8c9ad352cb7b2fbb3ed1d6c5d7d9c32f27a90f5cfb2b1a00426def1f712d679da68f5795')
prepare() {
  cd $_pkgname-$pkgver

  for patch in ../*.patch; do
    patch -Np1 -i "$patch"
  done
}

build() {
  cd $_pkgname-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd $_pkgname-$pkgver/build

  make install DESTDIR="$pkgdir"
}
