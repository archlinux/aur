# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.3.4
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
depends=('nodejs' 'noto-fonts')
# noto-fonts required due to bug https://github.com/ONLYOFFICE/DocumentServer/issues/377#issuecomment-455782913
makedepends=('npm' 'nodejs' 'grunt-cli' 'qt5-base' 'git' 'wget' 'p7zip' 'clang' 'python2' 'java-runtime' 'svn' 'ncurses5-compat-libs')
# ncurses-5compat-libs required to build v8
optdepends=('rabbitmq' 'redis' 'postgresql')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/archive/ONLYOFFICE-DocumentServer-${pkgver}.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/41606e907a93f22cc6e62a15813a441fff416c8b.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/ea34b02b1234ea9c4fb68e2a95fd2d689b5ab2dd.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/8c4afc1bd3ffa893f0728b89bd88fd1560fec4ae.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/70bf6846ec031ddd3f2d006f3396672874c73563.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/6c4ba1e0b28408cb2df05b5b3680da1b2152ff57.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/7db900bdc9506862798b20a3b5556fcc9be53708.tar.gz"
	"web-apps-pro-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps-pro/archive/55253c4d75ba209093d11edd7cb3a121cce3eade.tar.gz"
	"server_makefile.patch"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"onlyoffice-documentserver.hook"
	"onlyoffice-documentserver.sysusers"
	"onlyoffice-documentserver.tmpfiles")
sha512sums=('e9b2f1ccad0d86c4987e5691fb5baadc8eb63acaf0ca44ff021279eb5dbc88592a3fb8c478f7155cda52c795756def5ddcf2acdf9a7cfd1b9aaf4bd4c8c9d8fc'
            'ceb8dcdd8603076e2e573ff342cb6532ba732ff60f95216d8bfe268d10a68420a882f51eb029817ecfcd599553d867aaa30c431dab70554b08568dffd1d51909'
            '3d79a57aba908f362fb244fc05436d13a8611812545d9f790e4c92baede29cfecd56fab7b2d65d8e136a422f34a4475ec0154016cc96c7387da317e1a39999a1'
            'e70de033f49924e1587e2d648a8d8db4ace3e1962b3bb7f92524ceec47f99cf73e9bc5b1640a4bba46a416bfa56fab335801f4b5ccae8a92d509b160cb07bb9e'
            '9525a39490f0eee56755d4339a912bd26231dbe14847d88d57c587b3b84c5412d6f1a1ee5169f22f56b91da56fcb86ef7762e773b6736d93aabfc53e89e75458'
            '7fb7f2d8a9fb24a4a49493d85f5c3093befc038ea4e679aa9b1f77225333ceec5c881d01c2988f70051307bf75a1f1dfd884ec3a5475e4469f6bc7028125beea'
            'f351aba1675256ddd5867e5a5df0cbaea3dc85479cbe8c255275098b27456693d9641700db2c3870f608d444b3b083cf04bd669f338e24e9d4b068ef50c16c94'
            '10d56f644387031ccb22eb20b5a7c8f3e83c616f40d7375f0696ee66d4616ebadf9267496d16420930c36ca2d278d3077824db45dd198aece095e65aca7d181c'
            'b80098617889cabfb991419855da9c859d1c5874236fdb5106562dc6cfd8db76530d99fb63c56e2a0f46bf847226ed824956533a6478926f7d0aa48eb243eff1'
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

  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}"
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
  cd "${srcdir}/DocumentServer-ONLYOFFICE-DocumentServer-${pkgver}/server"
  install -Dm 644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm 644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm 644 "${srcdir}/onlyoffice-spellchecker.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-spellchecker.service"
  install -D "${srcdir}/onlyoffice-documentserver.hook" "${pkgdir}/usr/share/libalpm/hooks/onlyoffice-documentserver.hook"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.sysusers" "${pkgdir}/usr/lib/sysusers.d/onlyoffice-documentserver.conf"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/onlyoffice-documentserver.conf"
  make DOCUMENT_ROOT="/usr/share/webapps/onlyoffice/documentserver" DESTDIR=${pkgdir} install
}
