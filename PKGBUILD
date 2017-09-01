# Maintainer: Sledge Sulaweyo <sledge.sulaweyo#gmail.com>
# Contributor: Rafael Reggiani Manzo <rr.manzo#protonmail.com>
# Contributor: Jeremy Audet <ichimonji10#gmail.com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Mikhail Kulemin <mihkulemin@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>

pkgname=opennebula
_unstable_pkg=opennebula-unstable
pkgver=5.4.0
pkgrel=4
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
        'vip.sh.patch'
        'opennebula.install')
sha512sums=('4d7d4f6c20a6185539a88006e4d15681d90cee45506d36017a538415a3b3cce809f02ff248013f9e2daa5f1d20afd308a0a014853b8462723ad6ba5acaa84626' #package
            'c669df1cacf74124b04913f38d6468d78a8ac86e059676611c993ed5528fd7d17bbb92c87562836c8fe22ea80d848fa9d9f46c30664a05d10cf91d1363f3087f' #opennebula.service
            'b1a361cabc5b49ec8cbe497d8a6f205ed222dadda70ec33f922050b8bdf86b1e52c7098d732b752493ce3626c043f6b482f33dd380f0ebaaf2f53415f58cb75d' #opennebula-scheduler.service
            '9e6c1017a58e5d53529342c55b241c4d2dac1470fc163e4e8c4e69fe42da4d2d8a58dafdf5ab2adb30ac1d8cdc79d73f7b66392855a8f4ce1fa7e7da65554ac7' #opennebula-sunstone.service
            '62e8a3640df5e4a9619cbd24dddaa273103fe0b4af5edd6947442c213dbff34993868f091662ce42c0c7b1398a3407bf62c0a57b5cf8f88f0d50f0270040c0e3' #opennebula-econe.service
            '6e520889ac98e5ea17d7310c6bcb6fa14d68b8003dc6f57cf290545240224a428747bd157df4e2d1955c77ce7ebffad0b3eaa54ffc53db592696899533cc294e' #opennebula-oneflow.service
            '5ab22f35adfd48444accef6ffa2483665bd178dbad2320929b7be7e4bdc8a2782087f36c8b518537765bcf12dfdb3f5fcc19b8b34f41f2e1f85fb81071728e55' #opennebula-onegate.service
            'd856c5469703168e8cd3b53b68cca7555885c7c01ee7bad69dfc070448247c2da8434c1a49455edab6b6a0cf6ed127a1729758137b3535dd881c374de7e17c1c' #opennebula-novnc.service
            '620581599f1b0c4c6d4fdb87a6b41c937b8ef79401a6a047f8556517c726a5c61f9fc241a3d82a836b5728de3aa36a11d45cbfb1beb111e35c75485cb7b97228' #opennebula.conf
            '59ccef79f578997b5a1ef5bf53bc36beb233f935b13da466b887254272036b876946e1b74ed3692f4dc8bc2cc3855a61f06d047e179d8aefe73afbfeb886b655' #opennebula.logrotate
            '01aaf2d6019003ab69cd2e9886618d59bed27062f68fe72f29662f70af9206ce3921053c4cab30c370da958be243a6b19e85094af40ff93b6e370505ddd8bbe2' #chown_fix.patch
            'cee672a3fb9bffdac836a9aa00c898a38303144be44521363ad8e5109aebaa00e31fc0ae921e3a71a87e734fc614f6b3350009d5ec899bc5d78e6fe6d6c8fc01' #set_locations.patch
            '18b1964cb4e3fc2eaa93a7ef79e4b9b185584d33ad4f7fa33cd33a74516334136d9cf0ee25921c189250420b751c753cb0142227e8de39e14f8d110e97cd8e30' #fix_kvm_emulator.patch
            '5b13cd565d2c73e5a5582dc2efcef58e84ee206b96519c2a371a09b52305620b062ca81daf35ed582e182afcc421b668a8ee3fc999a295fa8973d11482c5083b' #vip.sh.patch
            '235d47ab6b7342db65b73533fab8084484cb95914604ffc68a419a13b41540b5e7983f46808f9b9cfc90bfeb69dfb1dfd8be61167791246e1631e93296a6ac7e' #opennebula.install
            )

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

