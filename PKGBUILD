# Maintainer: Rafael Reggiani Manzo <rr.manzo#protonmail.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=5.0.2
pkgrel=2
pkgdesc="Virtual management infrastructure as a service (IaaS) toolkit for cloud computing (NOTE: Read the PKGBUILD!)"
arch=('i686' 'x86_64')
url='http://docs.opennebula.org/stable'
license=('Apache')
depends=('ruby>=1.8.7'
         'xmlrpc-c>=1.31'
         'openssl>=0.9.8'
         'sqlite3>=3.6'
         'openssh'
         'libxml2>=2.7'
         'curl'
         'libxslt'
         'expat'
         'cdrkit'
         'log4cpp>=1.0'
         'ruby-opennebula>=4.14.2'
         'ruby-sinatra'
         'ruby-builder'
         'ruby-nokogiri')
makedepends=('xmlrpc-c>=1.31'
             'pkgconfig'
             'scons>=0.98')
optdepends=('nfs-utils: for using the shared file system storage model'
            'mariadb>=5.1: optional replacement for SQLite as the DB back-end'
            'libmariadbclient>=5.1: required if using MariaDB/MySQL instead of SQLite'
            'ruby-sequel: required when upgrading the database'
            'ruby-sqlite3: required when upgrading the database')
conflicts=('opennebula-unstable')
install=opennebula.install
backup=('etc/one/oned.conf'
        'etc/one/sunstone-server.conf'
        'etc/one/cli/onedatastore.yaml'
        'etc/one/cli/oneshowback.yaml'
        'etc/one/cli/onevdc.yaml'
        'etc/one/cli/onemarket.yaml'
        'etc/one/cli/onetemplate.yaml'
        'etc/one/cli/onevm.yaml'
        'etc/one/cli/oneacct.yaml'
        'etc/one/cli/oneuser.yaml'
        'etc/one/cli/onevrouter.yaml'
        'etc/one/cli/oneimage.yaml'
        'etc/one/cli/onemarketapp.yaml'
        'etc/one/cli/onehost.yaml'
        'etc/one/cli/onevnet.yaml'
        'etc/one/cli/onecluster.yaml'
        'etc/one/cli/onezone.yaml'
        'etc/one/cli/onesecgroup.yaml'
        'etc/one/cli/onegroup.yaml'
        'etc/one/cli/oneacl.yaml'
        'etc/one/ec2_driver.conf'
        'etc/one/econe.conf'
        'etc/one/az_driver.conf'
        'etc/one/onegate-server.conf'
        'etc/one/oneflow-server.conf'
        'etc/one/az_driver.default'
        'etc/one/tmrc'
        'etc/one/vmm_exec/vmm_execrc'
        'etc/one/vmm_exec/vmm_exec_vcenter.conf'
        'etc/one/vmm_exec/vmm_exec_kvm.conf'
        'etc/one/oned.conf'
        'etc/one/auth/ldap_auth.conf'
        'etc/one/auth/x509_auth.conf'
        'etc/one/auth/server_x509_auth.conf'
        'etc/one/ec2query_templates/m1.small.erb'
        'etc/one/defaultrc'
        'etc/one/sunstone-views.yaml'
        'etc/one/hm/hmrc'
        'etc/one/sunstone-logos.yaml'
        'etc/one/sunstone-views/admin.yaml'
        'etc/one/sunstone-views/groupadmin_vcenter.yaml'
        'etc/one/sunstone-views/cloud_vcenter.yaml'
        'etc/one/sunstone-views/admin_vcenter.yaml'
        'etc/one/sunstone-views/cloud.yaml'
        'etc/one/sunstone-views/groupadmin.yaml'
        'etc/one/sunstone-views/user.yaml'
        'etc/one/sched.conf'
        'etc/one/ec2_driver.default')
changelog=ChangeLog
source=("http://downloads.opennebula.org/packages/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'opennebula.service'
        'opennebula-mysqld.service'
        'opennebula-sunstone.service'
        'opennebula-econe.service'
        'opennebula-oneflow.service'
        'chown_fix.patch'
        'set_locations.patch'
        'fix_kvm_emulator.patch')
sha512sums=('95d61476538e32b75c3ac870c4ba19e4f352a90e1d6e76355efab4f4679291ba2fcd223ec39f9b3cbd29bc5c5c7a5388c1c402c5c84b22f81729ff240b6d34b6'
            '6ac7ee8e8fae29e4b37e3928ca3e499b9d83c3ed56b233c8f1822797dc81b2c36cf6f6d8fd4cbd74f582f3df0b859f9ca325fcd094c70806bf394748a03152da'
            'f049af21fd192d243019983121046b4257a83d79c6c1d7d1546db799dc4e036c0eb6eca540eb6997a19d72dd47db8533f5b11f2689a81b574783942ae326697d'
            'd6342d963d99ef95dbff68775b3be73fd76b39c2c3dbf6f9c47dbb25a5dcb9d6ba2d80ddcd6af35844d2d854a06345b190255576c963ca1bfbca194212653f3d'
            '94cfa67418ea1e9e11ae21debf736f38a1b62c6bbb258a11a3c173c6260babf5edd188ab446d80b64309a8a683e50da6e957dd1183144bc569cfe2d561df4ee5'
	    '4c5b3db9378ef04e3ac0fad7dd79e5b3bb0a559c1f2960d86a2f3baaadb60418d3a8e041655b68fdb2df7c6f19a41f02f92f948b0e94d2ffa05010f66fa2f84d'
            '8d6a311072da61ca49458aaf787daf4ef5c5969a9aa282f2276d679dc38e14e5fd1c23bc51b12a29d2d40b65aa45bd2c38d6741726b09d75a38565b7d4ad4677'
            '1f20e688a0f6d36a6bc875392473e75c7de77b159b9cbdf262ac0f093b4d65555231ab15897156e2558d0df6ae631f8d79a3265073ea8c0546586937544e47c9'
            '997218a2dbc807cf2114fc5bb68a3da8d17cdf38aa3d7b51afaab52cf2638cc46293d42799a6d805b799c7748e326ab2780f81ca73121ebdf320ec046c41407d')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Patch upstream install script to not attempt to chown the install
  # directories because `makepkg` will otherwise fail on a fresh installation.
  # We do our own chown in post_install().
  patch < "${srcdir}/chown_fix.patch"
  patch < "${srcdir}/set_locations.patch"
  patch -p1 < "${srcdir}/fix_kvm_emulator.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  ###########################################################################
  ##                                                                       ##
  ## It is highly recommended that you read the documentation and tweak    ##
  ##     the PKGBUILD accordingly:                                         ##
  ## http://docs.opennebula.org/stable/integration/references/compile.html ##
  ##                                                                       ##
  ## This package assumes a self-contained install. If you do NOT want a   ##
  ##     self-contained install, then remove `-d /srv/cloud/one` from the  ##
  ##     package() function and MAKE SURE you properly change the          ##
  ##     appropriate sections of opennebula-unstable.install               ##
  ##                                                                       ##
  ###########################################################################

  # This builds the vanilla OpenNebula package. Tweak this line as desired.
  scons new_xmlrpc=yes
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m644 "${srcdir}/opennebula.service" "${pkgdir}/usr/lib/systemd/system/opennebula.service"
  install -D -m644 "${srcdir}/opennebula-mysqld.service" "${pkgdir}/usr/lib/systemd/system/opennebula-mysqld.service"
  install -D -m644 "${srcdir}/opennebula-sunstone.service" "${pkgdir}/usr/lib/systemd/system/opennebula-sunstone.service"
  install -D -m644 "${srcdir}/opennebula-econe.service" "${pkgdir}/usr/lib/systemd/system/opennebula-econe.service"
  install -D -m644 "${srcdir}/opennebula-oneflow.service" "${pkgdir}/usr/lib/systemd/system/opennebula-oneflow.service"

  DESTDIR="${pkgdir}" ./install.sh -u oneadmin -g cloud
}
