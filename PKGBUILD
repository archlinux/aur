# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.1.5
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'clang' 'libtinfo5' 'python2' 'java-runtime' 'ncurses5-compat-libs' 'svn')
# ncurses5-compat-libs, libtinfo5 required due to bug:
# svn is required in core/Common/3dParty/icu/fetch.sh script
depends=('nodejs<10')
# required due to bug: https://github.com/ONLYOFFICE/DocumentServer/issues/304
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/94548131a14c93e3aa00d991acf52535db3e5d71.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/aed4b69cbebfb07134aa9e38e062dd83f4717626.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/f62ae70eb6d4fedeb676593e2ba22de29239e7e2.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/f0c5c8444ef993b6ae06f7833fb5e48d93f46044.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/71cff31a270316d9b2155f168f1130fa9f8d50fd.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/20a3a973df0cfc82b3bb1c2fe2c39722bdbf36e6.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/c4d27ff612306895d7f52987ac7c714a61605f49.tar.gz"
	"docbuilder_p.patch"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"https://github.com/ONLYOFFICE/DocumentServer/releases/download/ONLYOFFICE-DocumentServer-${pkgver}/onlyoffice-documentserver_amd64.deb")
sha512sums=('7745699a2ee5240faf48ada52e82c2ea1895c04b4f13e40713009c121c1450f2b6d0a8a6bd34dc8a9ec95febf775f73f26c1fb9c7600483913ffe7702f3f6c2f'
            'c1c77d1726d4a99f54826e28fea4c69f4022284ab852f7b53c4fb5c74eff9b1af6e8017940fe26177f07e854772e8b01db5c0f49e1de6f9195e3b74cf885eab7'
            '9ecb75a95f29e998b09cff7e98f3fae1408a779f59734fd8f5e1a1ab6e58f191d0c64006a9fa196ba5d932ca4ebcfc80a7fce089adfb5ec639df4646c6411222'
            '187086bf2c768bdbee7331b23838f161461711cb0d96b0b488a7a72e282778b22ecd2c6810e006ee4e8120686656426c5b5288584aece5b2f29b3f5224bd0092'
            '30309d33433b9bfe5a774f891c05ff59aa57c8802aecce1b136566bc6d4d1da5b86fa2913c5104e1557c15eb7cb1402a5c2c31a1f0e0767f5f0442d344030718'
            '0f5681cba03d8a82d9289c76723250735dd34068fa97c848482d678b074757c85dc54141962b76866f661932a0cade64f17748d565843299cacc2c434606759f'
            'f10fd8a9206e92c240fa362e3f42f780300ab60ae5cc2cfe6b845a1db43ffa95eb9ad96dcc63eedfea040f4f400985fca9123a4616ca1c4569da6e7dd04844b9'
            '3c6d04efb4f050daff81d76647c8634604add3cf380f21ad665ae68cd9cd378da389bbaf39978d91dff3458adea40214dcc77d92a168545afbd725feee22ff61'
            '4875f25a76731e43c4a08f7c2b557d337224c34ddf2a9b0348c4bf325bfcfc11c6b4f834d5c7da486957ec0380cfaaf45b83dd920e6e660fb6f4d1f3857fd787'
            '7d3b1d04f55b93e828b287369b9eb6f5e2511004b7c737dd5d0676d8aca4c87da985b562e89f63a0b16110980719aaec9f127a731b231992e35d457c088dd5f3'
            '5c691e07eccd51f543de92cc7f7fd5a5aac77fa2a6cf786f439a4ea43abc7606180aa5a9dd3762200091a4b3a479860881f94aefd0297d8e7ed955bf25c37417'
            '428e5c3326da53ee993871ab56c3b35c40fea5d5513950bee2a87b158f25cc0ebe76d690e4fa17bceb8583dde2f164fcf0a71a60652da1c67171d215f2528e6a'
            '6f53f9eec783dc00497e2ce495ce92dc1d78824e108ecdd914806fca4948e1748383125e0322a444bf9f8e158eacee06247b4966beb172522e3d176a8bc093a9'
            '5e30687098ea7e977d9f9fa68f9d72e155c0c63cd11d99db7104d8ebc295f5babfaa089aaacad54445630aadaca0f1b4593a7cac27e855d6c103157909868b2a')	    
install="onlyoffice-documentserver.install"
backup=('etc/webapps/onlyoffice/documentserver/production-linux.json'
	'etc/webapps/onlyoffice/documentserver/default.json')

prepare() {
  # Unfortunately, v8 depot_tools still requires python2
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  cd "${srcdir}"
  rm *.tar.gz

  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"
  rm -r core core-fonts dictionaries sdkjs sdkjs-plugins server web-apps
  mv ../core-fonts* core-fonts
  mv ../core-* core
  mv ../dictionaries-* dictionaries
  mv ../sdkjs-plugins-* sdkjs-plugins
  mv ../sdkjs-* sdkjs
  mv ../server-* server
  mv ../web-apps-* web-apps

  # Use clang instead of gcc because of compile errors
  sed -i 's/is_clang=false/is_clang=true/g' core/Common/3dParty/v8/build.sh

  # python2 dependency for gclient
  sed -i '13iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/fetch.sh
  sed -i '29iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/build.sh

  # patching core/desktopeditor/docbuilder file
  patch -p0 -i ../docbuilder_p.patch

  # Patching Makefile to include DESTDIR variable
  patch -p0 -i ../server_makefile.patch

  # Patching configuration file
  sed -i 's/\/var\/www\/onlyoffice/\/usr\/share\/webapps\/onlyoffice/g' server/Common/config/production-linux.json
  sed -i 's/\/etc\/onlyoffice/\/etc\/webapps\/onlyoffice/g' server/Common/config/production-linux.json

  # icu compile error (it's too old, already fixed upstream)
  sed -i '68ised -i "s/xlocale/locale/" i18n/digitlst.cpp' core/Common/3dParty/icu/fetch.sh

  # allfontsgen segfaults, some error in icu lib. copy compiled version from deb package
  cd "${srcdir}"
  tar xf "${srcdir}/data.tar.xz"
}

build() {
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"

  # workaround bug https://github.com/ONLYOFFICE/onlyoffice-owncloud/issues/42
  export PRODUCT_VERSION=${pkgver}

  # Download & build third party modules 
  cd core/Common/3dParty
  ./make.sh

  # Building core
  cd ../..
  make

  # Building sdkjs
  cd ../sdkjs
  make

  # Building server
  cd ../server
  make 
}

package() {
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"
  cd server
  make DOCUMENT_ROOT="/usr/share/webapps/onlyoffice/documentserver" DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm644 "${srcdir}/onlyoffice-spellchecker.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-spellchecker.service"
  # fix allfontsgen binary
  cp "${srcdir}/var/www/onlyoffice/documentserver/server/tools/AllFontsGen" "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/server/tools/AllFontsGen"
}
