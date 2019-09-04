# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.4.0
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
# notejs-lts-dubnium due to bug with nodehun build fail
depends=('nodejs-lts-dubnium' 'noto-fonts')
# noto-fonts required due to bug https://github.com/ONLYOFFICE/DocumentServer/issues/377#issuecomment-455782913
makedepends=('npm' 'nodejs-lts-dubnium' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'clang' 'python2' 'java-runtime' 'svn' 'ncurses5-compat-libs')
# ncurses-5compat-libs required to build v8
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-5.4.0-2.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/11dad1b10b67f7341b284b821b15cf9d90a0c4cd.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/abc25e4538cbce3ba96671283d14cec09087829b.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/0e43b7b8aeb099ec30725f39234e2b898e7f0e67.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/f6c385e9523f9c2136f421e3f843feded622aaf8.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/453f544a7f09fe5599a4ef6ae622faec1796f597.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/4ae78080f01940f2274dff72ec95f12e0133afe2.tar.gz"
	"web-apps-pro-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps-pro/archive/7aeeb4fe5889203a4578f1f86bd9387eca0c7a87.tar.gz"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"onlyoffice-documentserver.hook"
	"onlyoffice-documentserver.sysusers"
	"onlyoffice-documentserver.tmpfiles")
sha512sums=('bc16388fdad4afd4144b5d7618c74e44dcd483794c4d2b3a09fb86da2b1af97fd6171f27a5a2e414193ececfaa0bb863b2e5c50da4884d34f2acf78532d9488f'
            'b41f6316a11a8a5071b80e0e5460245d77b09697839802028151dfc10a8d0ed17c2961ed4496ff4ab3b446ae4ec187c716940278bac218d7a5bcb48a4bd7e0b6'
            '0a3a2daa0c3c8a3b63ae2e02b4afc2324c0b7cab70b87d18068790cd664d35a7b11083db2e56f62aa2508f942570092aa91ab78097755ab6d8ca3b1459767030'
            '9f59b29a946b421aed5ff81d8a1bf1e6f33ab95387a052dd53aa2b03313c44aac9a441e4bc5ef2caa2401d4eba24e843cf2dd90c90118ff96d89d540e36eef47'
            '44942d0c7587d41851704f35ed4b3f142f56cc921446bf81fcbd40b424b39dca98f9988c83464adb088df32341c613c239c3a4eb0fa9aaec5bac0215ba4257c5'
            'd3437320547ff3578c57d24d3040e3037fbdeae9a5b60a20451f4ae29ab2a0480fd57b917f503722ca88bcbfdb3340ec2a89aa7f1e33cbf97f2eb24d77b020aa'
            '57a8d6855ee9e1455e2c85003301deccb2ff8ee1855de9680d7b6dc22f6bf4c920bb28fc4626a461540a49873af0de5f4b49f54cfbb6b53adff520e677a89422'
            'edb2dc4b6d711453548f061ef8ebca94383a11bdbedbbe1da719c07ff0c72a54e3640f29df6dca7e3687b557b4f4ced87b609b388c057f036e4574a22fa66f7b'
            '40c9ecaa2b2008c152cfb89988bb175b3824550ca913b14365226be9b003c7c394d1c70d269ab64edb7d0eda483d4c67aac232f4ac404d73f5c807483e235f28'
            'f6e888d23d980eb50dcd70c1ce82324f3ee60c666298f77adf7f7abdf524d78bfcd10a8e17180a64596d964d98ae5457645ece6e3d05d93b938f465f2dc3612a'
            '8ed8c1301469242cc669a1f0520708ad0fa4f19406541c976cd9287917f573ec3f47902f9021eef5ff82ca20de04234f459e4826320689705772589b1aca0267'
            'fafee1aa872786116d5c28c08dbe12edcf0dd60890c40b108bb60c9d321d9a579fc8fe6a8a86c1641b58531388410fb51e09d294b9b998ca9a39373349e889a0'
            '707da287c3db6907fcdbf91cfe2ef057c77033713a1b4299a89a684b37fe3c74644e2c0b1fcec2afcd81c6511bb02ac3221d56c8caadb5d0c711d1842f78e780'
            'c7c23c5a7014e3251dfd86312d1d1e5c2d88f26ddc5aa967285202fd3ebf62c0a10c009b1cc5ad1b78e13fa0bc2eda515616d8af02325db434c0b2113c5b1ecb'
            'e1b8395ab7ef219860aebe9e7709a60cbaea1c28a8378aac3f54ce37b39944a7fd82b7efa8d59977f0891743cdface149b9f95f4b25c1c5322cb327c50d485ed')
backup=('etc/webapps/onlyoffice/documentserver/production-linux.json'
	'etc/webapps/onlyoffice/documentserver/default.json')
install="onlyoffice-documentserver.install"

prepare() {
  # Unfortunately, v8 depot_tools still requires python2
  # Bug: https://bugs.chromium.org/p/chromium/issues/detail?id=942720
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  cd "${srcdir}"
  rm *.tar.gz

  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}-2"
  rm -r core core-fonts dictionaries sdkjs sdkjs-plugins server web-apps-pro
  mv ../core-fonts* core-fonts
  mv ../core-* core
  mv ../dictionaries-* dictionaries
  mv ../sdkjs-plugins-* sdkjs-plugins
  mv ../sdkjs-* sdkjs
  mv ../server-* server
  mv ../web-apps-pro* web-apps-pro

  # Use clang instead of gcc because of compile errors
  sed -i 's/is_clang=false/is_clang=true/g' core/Common/3dParty/v8/build.sh

  # python2 dependency for gclient
  sed -i '12iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/fetch.sh
  sed -i '28iexport PATH="'${srcdir}'/path:$PATH"' core/Common/3dParty/v8/build.sh

  # Patching Makefile to include DESTDIR variable
  patch -p0 -i ../server_makefile.patch

  # Patching configuration file
  sed -i 's/\/var\/www\/onlyoffice/\/usr\/share\/webapps\/onlyoffice/g' server/Common/config/production-linux.json
  sed -i 's/\/etc\/onlyoffice/\/etc\/webapps\/onlyoffice/g' server/Common/config/production-linux.json
}

build() {
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}-2"

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
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}-2/server"
  install -Dm 644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm 644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm 644 "${srcdir}/onlyoffice-spellchecker.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-spellchecker.service"
  install -D "${srcdir}/onlyoffice-documentserver.hook" "${pkgdir}/usr/share/libalpm/hooks/onlyoffice-documentserver.hook"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.sysusers" "${pkgdir}/usr/lib/sysusers.d/onlyoffice-documentserver.conf"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/onlyoffice-documentserver.conf"
  make DOCUMENT_ROOT="/usr/share/webapps/onlyoffice/documentserver" DESTDIR=${pkgdir} install
}
