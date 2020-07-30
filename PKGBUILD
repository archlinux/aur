# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

# Bugs
# - allfontsgen, allthemesgen binaries doesn't work yet. Had to 
#   use precompiled ones.
# - Minifying of the js files sdk-all-min.js and sdk-all.js in 
#   /usr/share/webapps/onlyoffice/documentserver/sdkjs/ doesn't 
#   work yet. Had to use precompiled ones.
# - Had to replace further files:
#   /usr/share/webapps/onlyoffice/documentserver/sdkjs/common/libfont/wasm/fonts.js
#   /usr/share/webapps/onlyoffice/documentserver/sdkjs/common/libfont/js/fonts.js

pkgname=onlyoffice-documentserver
pkgver=5.6.0
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('nodejs-lts-dubnium' 'python' 'python2' 'git' 'p7zip' 'svn' 'qt5-base' 'clang' 'qt5-multimedia' 'pkg' 'ncurses5-compat-libs' 'gtk3' 'nss' 'nspr' 'libxss' 'npm' 'grunt-cli')
# python, ncurses5-compat-libs, clang, required for v8
# Nodejs-dubnium required for nodehun spellchecker
# gtk dependency for desktop editor, disabling it doesn't work yet
optdepends=('rabbitmq' 'postgresql' 'nginx')
license=('AGPL')
source=("build-tools-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/build_tools/archive/v5.6.0.21.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/82cdd75365a58fe0e87a3fec364fc1fc3c734010.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/959c01c91a49a8f72324332be4dd033081c213a1.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/2bff8e819ef459a041894d9600d053991c00e214.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/a0ad9645fc4103ca67ba3e346438567305082de8.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/ff599ba7d0387295e90fc3f38b30e1d639ce159a.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/40dc7f274f75b2fbfc8f72527537e2b72019ec1a.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/a4dcc7f1520926986c54949af57dfc8be2b0ca6a.tar.gz"
	"desktop-sdk-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/desktop-sdk/archive/d6fdb791b60b9eda3298fe484a2b8707cc884534.tar.gz"
	"document-server-integration-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/document-server-integration/archive/83bab147d0d597cde4eedfb2c50558fbcd2ffeb6.tar.gz"
	"document-builder-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/DocumentBuilder/archive/e6645204b0b1a82e031ec30255dfcfeb9384d06b.tar.gz"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"onlyoffice-documentserver.hook"
	"onlyoffice-documentserver.sysusers"
	"onlyoffice-documentserver.tmpfiles")
sha512sums=('b41db7751c85abda96a15ea430cb138c0802799fb69aef4f30eb5f8e6b43ad0dc3b1d5a12c4ffb1336f7e7d1d7636d4ae9e015f475a2c58da7c5273a874ebcba'
            '6900d42d638d19903e3bf53ebcdabcc71acf54e8bd65bfd3a7c4e88c783c72bdf8553bf172abd987378e765d71015c00a3a9c057374c4392d06066ecc02d4090'
            '722f5d1e273f7a1c7f95fa6b76bcb8965a729866be356ea60f296d0ba082b9a94149eb80ca41ad4be79664949481d9d89b50bd17fcfcb6090660ad9da708b1fa'
            '51a147f8cf5de7f10f226318f3995b3104b63d3dc846e04f8fbe9a1bbfa7ceebe52519fcb6ce3d565ca95fbd7f2faecbb7eebb0c19778bd551fcab8102902165'
            '73a4c2dc4b90ba04264d38176f55bc0500717a0cabd0da8852dae4490876a99a8b566f41a5eacb894ebe2bb1e06b53b2cc86478cc8f8d593c02013400c66e05b'
            '2e68cf4bd346f29e714e5b5782a2650b75811ad34009debb863e5b34649f817e8f6954bf489864ceee5a6df0eeec6774480959ca5e00eef2906560e25d51fea5'
            '46aab4ec8f3b8004d4a3287651e30b0a70a76cc8902bce77aff0b31a11df7c726eb00ae505abc9ba1613cfbc38e9b35112f6bb27e6732851ce85e76160b4d6e9'
            'b6f64bd537ae8d851f0f6a7d928cbf8f25d70209722e923edc8b274b315d5ef5d682f5ce907a04d8b1d7356382ea9040a8dac6041ac25f424ebfc0e65aec65cc'
            'caca6d459f85f500528e6427ad9d64bd98b419fad5815298233065669297fec952dd4bc32e3e2bb026340ab457fa936637a64149dff18e654691660117973464'
            'a1a6995b6f3b988f6c9998523c234cacd4d44ba2ef42064e7c0a535e5a5fd18448198f696f463323ec3f9bdfd9c270889a483b7a0e056c0722198dd9b42fab14'
            'c98b226bf7bc07f6c83d7945c1f7571ec1a555f17199e4260ec31b93a5712a4481fabcf71552f1fe96928fd26b9e4385d552d376780f65c87681be94c9a3e027'
            '848074ce03328915d251db45a5475f6a2dff3b15f53b3b1dfbd702a9dc184d53aea78da1310db9c60d85a35062ce9986f37843c000f269dcaf8d624ed29e0a60'
            '71cf274868452cef92eb4729d3bfe04ce7b3dd863aee8e7395cf166296206b07abb60756e09911395badbea1965eea4a9fa7595dba7f9bc1c7ad4b8158ac1263'
            '3df1f5339b394eef1b27317f5d0e7786d2cb8dbbd13cddb22047567c3703f384d95f092fc34ce3031aeb895f013d7c0686ce968e1fae7f1f24473c1a6615f7ad'
            '707da287c3db6907fcdbf91cfe2ef057c77033713a1b4299a89a684b37fe3c74644e2c0b1fcec2afcd81c6511bb02ac3221d56c8caadb5d0c711d1842f78e780'
            'c7c23c5a7014e3251dfd86312d1d1e5c2d88f26ddc5aa967285202fd3ebf62c0a10c009b1cc5ad1b78e13fa0bc2eda515616d8af02325db434c0b2113c5b1ecb'
            'e1b8395ab7ef219860aebe9e7709a60cbaea1c28a8378aac3f54ce37b39944a7fd82b7efa8d59977f0891743cdface149b9f95f4b25c1c5322cb327c50d485ed')
backup=('etc/webapps/onlyoffice/documentserver/production-linux.json'
	'etc/webapps/onlyoffice/documentserver/default.json')
install="onlyoffice-documentserver.install"
options=('!strip')

prepare() {
  cd "${srcdir}"

  # Unfortunately, v8 depot_tools still requires python2
  # Bug: https://bugs.chromium.org/p/chromium/issues/detail?id=942720
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  # Rename source directories
  for dir in "core" "core-fonts" "dictionaries" "sdkjs" "sdkjs-plugins" "server" "web-apps" "desktop-sdk" "document-server-integration" "DocumentBuilder"
  do
    rm -rf "${dir}"
    find . -maxdepth 1 -type d -regex "./${dir}-[a-z0-9]*" -exec mv '{}' ${dir} \;
  done

  # Configuration for build-tools
  cd "build_tools-5.6.0.21"
  ./configure.py --branch master --module server --update 0 --qt-dir /usr/include/qt

  # Unsure how to fix path to QT-dir
  sed -i '45i\ \ \ \ qt_dir = ""' scripts/build.py

  # Fix config file paths
  sed -i 's|/var/www/onlyoffice|/usr/share/webapps/onlyoffice|g' "${srcdir}/server/Common/config/production-linux.json"
  sed -i 's|/etc/onlyoffice/documentserver|/etc/webapps/onlyoffice/documentserver|g' "${srcdir}/server/Common/config/production-linux.json"

  # Ignore grunt warnigns otherwise compilation will fail
  sed -i '54d' "${srcdir}/build_tools-5.6.0.21/scripts/build_js.py"
  sed -i '54i\ \ return base.cmd_in_dir(directory, "grunt", ["--force"] +  params)' "${srcdir}/build_tools-5.6.0.21/scripts/build_js.py"
}

build() {
  cd "${srcdir}/build_tools-5.6.0.21"

  export PATH="${srcdir}/path:$PATH"
  ./make.py
}

package() {
  install -d "${pkgdir}/usr/share/webapps/onlyoffice"
  install -d "${pkgdir}/etc/webapps/onlyoffice/documentserver/log4js"
  install -d "${pkgdir}/var/lib/onlyoffice/documentserver"
  cp -r "${srcdir}/build_tools-5.6.0.21/out/linux_64/onlyoffice/documentserver" "${pkgdir}/usr/share/webapps/onlyoffice/"
  mv "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/Common/config/default.json" "${pkgdir}/etc/webapps/onlyoffice/documentserver/"
  mv "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/Common/config/production-linux.json" "${pkgdir}/etc/webapps/onlyoffice/documentserver/"
  mv "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/Common/config/log4js/production.json" "${pkgdir}/etc/webapps/onlyoffice/documentserver/log4js/"

  install -Dm 644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm 644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm 644 "${srcdir}/onlyoffice-spellchecker.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-spellchecker.service"
  install -D "${srcdir}/onlyoffice-documentserver.hook" "${pkgdir}/usr/share/libalpm/hooks/onlyoffice-documentserver.hook"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.sysusers" "${pkgdir}/usr/lib/sysusers.d/onlyoffice-documentserver.conf"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/onlyoffice-documentserver.conf"
}
