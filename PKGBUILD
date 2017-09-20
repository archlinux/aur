# Maintainer: Sledge Sulaweyo <sledge.sulaweyo#gmail.com>
# Contributor: Rafael Reggiani Manzo <rr.manzo#protonmail.com>
# Contributor: Jeremy Audet <ichimonji10#gmail.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=5.4.1
pkgrel=1
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
        'opennebula-scheduler.service'
        'opennebula-sunstone.service'
        'opennebula-econe.service'
        'opennebula-oneflow.service'
        'opennebula-onegate.service'
        'opennebula-novnc.service'
        'opennebula.conf'
        'opennebula.logrotate'
        'chown_fix.patch'
        'set_locations.patch'
        'fix_kvm_emulator.patch'
        'opennebula.install')
sha512sums=('e6660c44c7fcb1d32077b483814ccaad03bca0f6264671548b6ef9cc60f544b134ea3d9ade13a959340bb1f8c94cf08c8246ea929073cf89d6ee35f8b2e19904' #package
            'e651669847686a3170420485c6181261f5459336f5c5dc3735ba937b1a4cb1876baac60b5b998cb2ae7d04c4f449656c154391ccd62d7181d2a6d60e0c0ac0b1' #opennebula.service
            'a563f1c6458d16c6b13f92aaf0b515127a2c30f25cd398eba0571d511fd38dfcfc0a3374d2df242dbd1963f6a0fd85fa95ee8ac1766f8d39717d7998479d9db9' #opennebula-scheduler.service
            '102f361eb1760dbac012c14bc1723f94089645dc1e4ce6b752e173154df671c8dcca26872a5487bb6a890460164fc32b641679e4da6f9d6a6c72a2090acd3f22' #opennebula-sunstone.service
            '52518dc9b8b4695b70935ca4e86813c45d0ae5ead1b08eb4935eccd5a7175cf979d0315afdaf5c346d729f39e0bd3cb4b63d4eb02128f48f3f973cae4c6e57df' #opennebula-econe.service
            '0f3e2a14b2077366c55c209ec630535b258d9632ce54a424eac36c173929f9886cf94a0991766e9f17d40c1095f8bb157fccbc6568d4bf6228d3ceb826cef628' #opennebula-oneflow.service
            'b52f04a655212730089e641bef68bf5a892423b61ed33c2ea5a59e993c1668149e98d81272e162e3e1a87b3e9f904ab1a738248e4dcf32a8a11dc8b471e7cbad' #opennebula-onegate.service
            '645765b6752d5a021412e633b950959201d0be92e4845894dba2a3137e1dae57d62f41b55ebbd098a065528ba836b07c3ebf1a7a6f7cbfa49b2a3da12ead6012' #opennebula-novnc.service
            '620581599f1b0c4c6d4fdb87a6b41c937b8ef79401a6a047f8556517c726a5c61f9fc241a3d82a836b5728de3aa36a11d45cbfb1beb111e35c75485cb7b97228' #opennebula.conf
            '9a8d4f7541bbf29cbaad9b02c4c0c68b38e9bca7814cb2c99de4e7a8e2677a9e742936422d44b82a407d4479279c0ed94bd2774f055987fa91445c2538d01838' #opennebula.logrotate
            '01aaf2d6019003ab69cd2e9886618d59bed27062f68fe72f29662f70af9206ce3921053c4cab30c370da958be243a6b19e85094af40ff93b6e370505ddd8bbe2' #chown_fix.patch
            'cee672a3fb9bffdac836a9aa00c898a38303144be44521363ad8e5109aebaa00e31fc0ae921e3a71a87e734fc614f6b3350009d5ec899bc5d78e6fe6d6c8fc01' #set_locations.patch
            '18b1964cb4e3fc2eaa93a7ef79e4b9b185584d33ad4f7fa33cd33a74516334136d9cf0ee25921c189250420b751c753cb0142227e8de39e14f8d110e97cd8e30' #fix_kvm_emulator.patch
            '1ba0b07b69f6f7cc48b5c3f79834682e609f207f8e2edb6ed41574bbc06afbed147d4b4ea10993b55a416c328dcc6d72495abc6957a31f73988cee12f31b08d3' #opennebula.install
            )

prepare() {
  cd "${pkgname}-${pkgver}"

  # Patch upstream install script to not attempt to chown the install
  # directories because `makepkg` will otherwise fail on a fresh installation.
  # We do our own chown in post_install().
  patch < "${srcdir}/chown_fix.patch"
  patch < "${srcdir}/set_locations.patch"
  patch -p0 < "${srcdir}/fix_kvm_emulator.patch"
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
  install -D -m644 "${srcdir}/opennebula-scheduler.service" "${pkgdir}/usr/lib/systemd/system/opennebula-scheduler.service"
  install -D -m644 "${srcdir}/opennebula-novnc.service" "${pkgdir}/usr/lib/systemd/system/opennebula-novnc.service"
  install -D -m644 "${srcdir}/opennebula-sunstone.service" "${pkgdir}/usr/lib/systemd/system/opennebula-sunstone.service"
  install -D -m644 "${srcdir}/opennebula-econe.service" "${pkgdir}/usr/lib/systemd/system/opennebula-econe.service"
  install -D -m644 "${srcdir}/opennebula-oneflow.service" "${pkgdir}/usr/lib/systemd/system/opennebula-oneflow.service"
  install -D -m644 "${srcdir}/opennebula-onegate.service" "${pkgdir}/usr/lib/systemd/system/opennebula-onegate.service"
  install -D -m644 "${srcdir}/opennebula.conf" "${pkgdir}/etc/tmpfiles.d/opennebula.conf"
  install -D -m644 "${srcdir}/opennebula.logrotate" "${pkgdir}/etc/logrotate.d/opennebula"

  DESTDIR="${pkgdir}" ./install.sh -u oneadmin -g cloud
}

