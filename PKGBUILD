# Maintainer: Rafael Reggiani Manzo <rr.manzo#protonmail.com>
# Contributor: Jeremy Audet <ichimonji10#gmail.com>
# Contributor: Sledge Sulaweyo <sledge.sulaweyo#gmail.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=5.4.0
pkgrel=2
pkgdesc="Virtual management infrastructure as a service (IaaS) toolkit for cloud computing (NOTE: Read the PKGBUILD!)"
arch=('i686' 'x86_64')
url='http://docs.opennebula.org/stable'
license=('Apache')
depends=('ruby'
         'xmlrpc-c'
         'openssl'
         'sqlite3'
         'openssh'
         'libxml2'
         'curl'
         'libxslt'
         'expat'
         'nfs-utils'
         'cdrkit'
         'log4cpp'
         'python2' #needed for novnc
         'mariadb'
         'libmariadbclient')
makedepends=('xmlrpc-c'
             'pkgconfig'
             'scons'
             'mariadb'
             'libmariadbclient')
optdepends=('nfs-utils: for using the shared file system storage model'
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
        'opennebula-sunstone.service'
        'opennebula-econe.service'
        'opennebula-oneflow.service'
        'opennebula-onegate.service'
        'chown_fix.patch'
        'set_locations.patch'
        'fix_kvm_emulator.patch'
        'vip.sh.patch'
        'opennebula.install')
sha512sums=('4d7d4f6c20a6185539a88006e4d15681d90cee45506d36017a538415a3b3cce809f02ff248013f9e2daa5f1d20afd308a0a014853b8462723ad6ba5acaa84626'
            'd86b01dd0b0718e1f2c75ffa1220a621ce4953d2cb722defef51c9cb0ec7b3f7709c7cd760c87da9ecb16468ffed2eb7ecb40295f0d24f275648758784ecb745'
            '165232dfcae58a19dac689cf11c3b49ec0dea5c98835f7ced2c3cc32819204ffd16b90ac67e421730339613cc306577cebfe305d19ed5ea5edbfca70785f52f5'
            'f3b9bad7c234010b3aab20df17a4c2ab74242e2305acc2cdfa3e36130674c8804aa5c89bdd8ca952d3d188541570da9841fa308d6f5e8dfc9c433628c7628898'
            'a8e9c781f575d57ba8badb4491ffb4ed1dd5b2b5b7434735974516f2a1533aca5b64a898759b861ca0aff72fe1c629547d8dcbbc29ad45429d3e29f4e7a01160'
            '0fcfa0990623f6df0d48f24d1bcbc7482e589a454f33e47b4832633f064475d69f1784d87588d66e6d8b37ee448ab64e9a73442c56fcdd3eca66e4b487ea7b84'
            '01aaf2d6019003ab69cd2e9886618d59bed27062f68fe72f29662f70af9206ce3921053c4cab30c370da958be243a6b19e85094af40ff93b6e370505ddd8bbe2'
            'cee672a3fb9bffdac836a9aa00c898a38303144be44521363ad8e5109aebaa00e31fc0ae921e3a71a87e734fc614f6b3350009d5ec899bc5d78e6fe6d6c8fc01'
            '18b1964cb4e3fc2eaa93a7ef79e4b9b185584d33ad4f7fa33cd33a74516334136d9cf0ee25921c189250420b751c753cb0142227e8de39e14f8d110e97cd8e30'
            'ad649b9671d55280485000f2f74beb676065dda7596d0dbc879a3323495b8e0384454692e2d380a055dc72d5056b2020826d056e163d64b85762ad84438e2509'
            '235d47ab6b7342db65b73533fab8084484cb95914604ffc68a419a13b41540b5e7983f46808f9b9cfc90bfeb69dfb1dfd8be61167791246e1631e93296a6ac7e')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Patch upstream install script to not attempt to chown the install
  # directories because `makepkg` will otherwise fail on a fresh installation.
  # We do our own chown in post_install().
  patch < "${srcdir}/chown_fix.patch"
  patch < "${srcdir}/set_locations.patch"
  patch -p0 < "${srcdir}/fix_kvm_emulator.patch"
  # Patch for https://dev.opennebula.org/issues/5309
  patch -p0 < "${srcdir}/vip.sh.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  ###########################################################################
  ##                                                                       ##
  ## It is highly recommended that you read the documentation and tweak    ##
  ## the PKGBUILD accordingly:                                             ##
  ## http://docs.opennebula.org/stable/integration/references/compile.html ##
  ##                                                                       ##
  ###########################################################################

  # This builds the vanilla OpenNebula package. Tweak this line as desired.
  scons -j "$(nproc)" new_xmlrpc=yes mysql=yes sqlite=yes
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m644 "${srcdir}/opennebula.service" "${pkgdir}/usr/lib/systemd/system/opennebula.service"
  install -D -m644 "${srcdir}/opennebula-sunstone.service" "${pkgdir}/usr/lib/systemd/system/opennebula-sunstone.service"
  install -D -m644 "${srcdir}/opennebula-econe.service" "${pkgdir}/usr/lib/systemd/system/opennebula-econe.service"
  install -D -m644 "${srcdir}/opennebula-oneflow.service" "${pkgdir}/usr/lib/systemd/system/opennebula-oneflow.service"
  install -D -m644 "${srcdir}/opennebula-onegate.service" "${pkgdir}/usr/lib/systemd/system/opennebula-onegate.service"

  DESTDIR="${pkgdir}" ./install.sh -u oneadmin -g cloud
}

